class HourlyForecast < ApplicationRecord
  validates :sunrise, presence: true, length: { is: 5 }, allow_blank: false
  validates :sunset, presence: true, length: { is: 5 }, allow_blank: false
  validates :period, presence: true, numericality: true, allow_blank: false
  validates :sky_state, presence: true, allow_blank: false
  validates :rain, presence: true, numericality: true, allow_blank: false
  validates :rain_probability, presence: true, numericality: true, allow_blank: false
  validates :storm_probability, presence: true, numericality: true, allow_blank: false
  validates :snow, presence: true, numericality: true, allow_blank: false
  validates :snow_probability, presence: true, numericality: true, allow_blank: false
  validates :thermal_sensation, presence: true, numericality: true, allow_blank: false
  validates :relative_humidity, presence: true, numericality: true, allow_blank: false
  validates :wind_velocity, presence: true, numericality: true, allow_blank: false
  validates :wind_direction, presence: true, length: { minimum: 1, maximum: 2}, allow_blank: false
  validates :temperature, presence: true, numericality: true, allow_blank: false

end
