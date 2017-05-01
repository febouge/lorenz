require 'aemet_requester'

# This job imports the data from AEMET and save it on the database.
# The main purpose of this job is to be scheduled periodically every 24 hours.
class ImportAemetDailyDataJob < ApplicationJob
  queue_as :default

  def perform
    reschedule_job
    import_aemet_daily_data
  end

  private

  def reschedule_job
    self.class.set(wait: 24.hours).perform_later
  end

  def import_aemet_daily_data
    json_data = request_data
    process_data(json_data)
    save_processed_data
  end

  def request_data
    requester = AemetRequester.new(ENV['APIKEY'], ENV['LOCATION_CODE'])
    requester.hourly_forecast_json
  end

  def process_data(raw_data)
    extract_today_forecast(raw_data)
    create_hourly_forecasts
    add_common_data
    add_hourly_data
    add_wind_data
    add_range_data
    fix_empty_data
  end

  def save_processed_data
    HourlyForecast.transaction do
      @forecasts.each(&:save!)
    end
  end

  def extract_today_forecast(raw_data)
    daily_forecasts = raw_data[0]['prediccion']['dia']
    @today_forecast = daily_forecasts.select { |element| element['fecha'] == Time.zone.now.to_date.to_s }[0]
  end

  def create_hourly_forecasts
    @forecasts = []
    periods = @today_forecast['temperatura'].map { |e| e['periodo'].to_i }
    periods.each do |period|
      forecast = HourlyForecast.new
      forecast.period = period
      @forecasts.push(forecast)
    end
  end

  def add_common_data
    @forecasts.each do |forecast|
      forecast.day = @today_forecast['fecha']
      forecast.sunrise = @today_forecast['orto']
      forecast.sunset = @today_forecast['ocaso']
    end
  end

  def add_hourly_data
    hourly_data_names = { 'estadoCielo' => 'sky_state', 'precipitacion' => 'rain', 'nieve' => 'snow',
                          'temperatura' => 'temperature', 'sensTermica' => 'thermal_sensation', 'humedadRelativa' => 'relative_humidity' }
    hourly_data_names.each { |key, value| add_data_for(key, value) }
  end

  def add_data_for(name_in_json, name_in_model)
    @today_forecast[name_in_json].each do |data|
      forecast = forecast_from_period data['periodo']
      forecast[name_in_model] = if 'estadoCielo'.eql? name_in_json
                                  data['descripcion']
                                else
                                  data['value']
                                end
    end
  end

  def add_wind_data
    wind_data = @today_forecast['vientoAndRachaMax'].select { |e| e.key? 'velocidad' }
    wind_data.each do |data|
      forecast = forecast_from_period data['periodo']
      forecast.wind_direction = data['direccion'][0]
      forecast.wind_velocity = data['velocidad'][0].to_i
    end
  end

  def forecast_from_period(period)
    @forecasts.select { |element| element.period == period.to_i }[0]
  end

  def add_range_data
    range_data_names = { 'probPrecipitacion' => 'rain_probability', 'probTormenta' => 'storm_probability',
                         'probNieve' => 'snow_probability' }
    range_data_names.each { |key, value| add_data_in_range_for(key, value) }
  end

  def add_data_in_range_for(name_in_json, name_in_model)
    @today_forecast[name_in_json].each do |data|
      matching_forecasts = forecasts_from_period_range data['periodo'][0..1], data['periodo'][2..-1]
      matching_forecasts.each do |forecast|
        forecast[name_in_model] = assign_non_empty_value data['value']
      end
    end
  end

  def forecasts_from_period_range(min, max)
    @forecasts.select { |element| element.period >= min.to_i && element.period <= max.to_i }
  end

  def assign_non_empty_value(value)
    value.blank? ? 0 : value
  end

  def fix_empty_data
    @forecasts.map(&:fix_empty_data)
  end
end
