require 'test_helper'

class HourlyForecastTest < ActiveSupport::TestCase
  test 'does not allow non numerical values for wind velocity' do
    hourly_forecast = HourlyForecast.new(wind_velocity: 'foo')
    hourly_forecast.valid?
    assert_match 'is not a number', hourly_forecast.errors.full_messages_for(:wind_velocity)[0]
  end

  test 'does not allow blank wind velocity' do
    hourly_forecast = HourlyForecast.new(wind_velocity: '')
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:wind_velocity)[0]
  end

  test 'allows numerical values for wind velocity' do
    hourly_forecast = HourlyForecast.new(wind_velocity: 3)
    hourly_forecast.valid?
    refute(hourly_forecast.errors.include?(:velocity))
  end
end
