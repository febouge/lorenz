require 'test_helper'

class HourlyForecastsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hourly_forecast = hourly_forecasts(:one)
    @second_forecast = hourly_forecasts(:two)
  end

  test 'should get index' do
    get hourly_forecasts_url
    assert_response :success
  end

  test 'get index returns json' do
    get hourly_forecasts_url
    assert_response_is_json
  end

  test 'should create hourly_forecast' do
    assert_difference('HourlyForecast.count') do
      post hourly_forecasts_url, params: { hourly_forecast: @second_forecast },
                                 as: :json
    end
    assert_response 201
  end

  test 'create hourly forecast returns json' do
    post hourly_forecasts_url, params: { hourly_forecast: @second_forecast },
                               as: :json
    assert_response_is_json
  end

  test 'should show hourly_forecast' do
    get hourly_forecast_url(@hourly_forecast)
    assert_response :success
  end

  test 'show hourly_forecast returns json' do
    get hourly_forecast_url(@hourly_forecast)
    assert_response_is_json
  end

  test 'invalid id in get forecast should return empty json' do
    get hourly_forecast_url(id: -10)
    assert @response.body.empty?
  end

  test 'should update hourly_forecast' do
    patch hourly_forecast_url(@hourly_forecast),
          params: { hourly_forecast: @second_forecast }, as: :json
    assert_response 200
  end

  test 'update hourly_forecast returns json' do
    patch hourly_forecast_url(@hourly_forecast),
          params: { hourly_forecast: @second_forecast }, as: :json
    assert_response_is_json
  end

  test 'should destroy hourly_forecast' do
    assert_difference('HourlyForecast.count', -1) do
      delete hourly_forecast_url(@hourly_forecast)
    end
    assert_response 204
  end

  test 'destroy hourly_forecast should not return nothing' do
    delete hourly_forecast_url(@hourly_forecast)
    assert @response.body.empty?
  end

  private

  def assert_response_is_json
    assert_equal 'application/json', @response.content_type
  end
end
