# Hourly Forecast controller. It allows to create, get, update and delete
# the forecasts.
class HourlyForecastsController < ApplicationController
  before_action :set_hourly_forecast, only: [:show, :update, :destroy]

  # GET /hourly_forecasts
  def index
    @hourly_forecasts = HourlyForecast.all

    render json: @hourly_forecasts
  end

  # GET /hourly_forecasts/1
  def show
    render json: @hourly_forecast
  end

  # POST /hourly_forecasts
  def create
    @hourly_forecast = HourlyForecast.new(hourly_forecast_params)

    if @hourly_forecast.save
      render json: @hourly_forecast, status: :created,
             location: @hourly_forecast
    else
      render_error
    end
  end

  # PATCH/PUT /hourly_forecasts/1
  def update
    if @hourly_forecast.update(hourly_forecast_params)
      render json: @hourly_forecast
    else
      render_error
    end
  end

  # DELETE /hourly_forecasts/1
  def destroy
    @hourly_forecast.destroy
  end

  def current
    time_elements = current_time_elements
    @hourly_forecast = HourlyForecast.where('period = ? AND day = ?', time_elements[:period], time_elements[:date])
    render json: @hourly_forecast
  end

  private

  def current_time_elements
    time_elements = Time.zone.now.to_s.split(' ')
    { date: time_elements[0], period: time_elements[1].split(':')[0].to_i }
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_hourly_forecast
    @hourly_forecast = HourlyForecast.find(params[:id])
  end

  def render_error
    render json: @hourly_forecast.errors, status: :unprocessable_entity
  end

  # Only allow a trusted parameter "white list" through.
  def hourly_forecast_params
    params.require(:hourly_forecast)
          .permit(:day, :sunrise, :sunset, :period, :sky_state, :rain,
                  :rain_probability, :storm_probability, :snow,
                  :snow_probability, :thermal_sensation, :relative_humidity,
                  :wind_velocity, :wind_direction, :temperature)
  end
end
