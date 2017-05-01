# Hourly Forecast Model. For every hour there will be a database register with
# the following information
class HourlyForecast < ApplicationRecord
  validates :sunrise, presence: true, length: { is: 5 }
  validates :sunset, presence: true, length: { is: 5 }
  validates :period, presence: true, numericality: true
  validates :sky_state, presence: true
  validates :rain, presence: true, numericality: true
  validates :rain_probability, presence: true, numericality: true
  validates :storm_probability, presence: true, numericality: true
  validates :snow, presence: true, numericality: true
  validates :snow_probability, presence: true, numericality: true
  validates :thermal_sensation, presence: true, numericality: true
  validates :relative_humidity, presence: true, numericality: true
  validates :wind_velocity, presence: true, numericality: true
  validates :wind_direction, presence: true, numericality: false,
                             length: { minimum: 1, maximum: 2 }
  validates :temperature, presence: true, numericality: true

  def fix_empty_data
    possible_empty_properties = %i(rain storm snow)
    probability = '_probability'
    possible_empty_properties.each do |name|
      self[name.to_s + probability] = self[name.to_s + probability].presence || 0
    end
  end
end
