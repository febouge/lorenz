require 'test_helper'

class HourlyForecastsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hourly_forecast = hourly_forecasts(:one)
  end

  test "should get index" do
    get hourly_forecasts_url, as: :json
    assert_response :success
  end

  test "should create hourly_forecast" do
    assert_difference('HourlyForecast.count') do
      post hourly_forecasts_url, params: { hourly_forecast: { day: @hourly_forecast.day, period: @hourly_forecast.period, rain: @hourly_forecast.rain, rain_probability: @hourly_forecast.rain_probability, relative_humidity: @hourly_forecast.relative_humidity, sky_state: @hourly_forecast.sky_state, snow: @hourly_forecast.snow, snow_probability: @hourly_forecast.snow_probability, storm_probability: @hourly_forecast.storm_probability, sunrise: @hourly_forecast.sunrise, sunset: @hourly_forecast.sunset, temperature: @hourly_forecast.temperature, thermal_sensation: @hourly_forecast.thermal_sensation, wind_direction: @hourly_forecast.wind_direction, wind_velocity: @hourly_forecast.wind_velocity } }, as: :json
    end

    assert_response 201
  end

  test "should show hourly_forecast" do
    get hourly_forecast_url(@hourly_forecast), as: :json
    assert_response :success
  end

  test "should update hourly_forecast" do
    patch hourly_forecast_url(@hourly_forecast), params: { hourly_forecast: { day: @hourly_forecast.day, period: @hourly_forecast.period, rain: @hourly_forecast.rain, rain_probability: @hourly_forecast.rain_probability, relative_humidity: @hourly_forecast.relative_humidity, sky_state: @hourly_forecast.sky_state, snow: @hourly_forecast.snow, snow_probability: @hourly_forecast.snow_probability, storm_probability: @hourly_forecast.storm_probability, sunrise: @hourly_forecast.sunrise, sunset: @hourly_forecast.sunset, temperature: @hourly_forecast.temperature, thermal_sensation: @hourly_forecast.thermal_sensation, wind_direction: @hourly_forecast.wind_direction, wind_velocity: @hourly_forecast.wind_velocity } }, as: :json
    assert_response 200
  end

  test "should destroy hourly_forecast" do
    assert_difference('HourlyForecast.count', -1) do
      delete hourly_forecast_url(@hourly_forecast), as: :json
    end

    assert_response 204
  end
end
