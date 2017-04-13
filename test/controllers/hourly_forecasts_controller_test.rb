require 'test_helper'

class HourlyForecastsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hourly_forecast = hourly_forecasts(:one)
    @second_forecast = hourly_forecasts(:two)
  end

  test 'should get index' do
    get hourly_forecasts_url, as: :json
    assert_response :success
  end

  test 'should create hourly_forecast' do
    assert_difference('HourlyForecast.count') do
      post hourly_forecasts_url, params: { hourly_forecast: @second_forecast },
                                 as: :json
    end

    assert_response 201
  end

  test 'should show hourly_forecast' do
    get hourly_forecast_url(@hourly_forecast), as: :json
    assert_response :success
  end

  test 'should update hourly_forecast' do
    patch hourly_forecast_url(@hourly_forecast),
          params: { hourly_forecast: @second_forecast }, as: :json
    assert_response 200
  end

  test 'should destroy hourly_forecast' do
    assert_difference('HourlyForecast.count', -1) do
      delete hourly_forecast_url(@hourly_forecast), as: :json
    end

    assert_response 204
  end
end
