require 'test_helper'

class ForecastsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @forecast = forecasts(:one)
  end

  test 'should get index' do
    get forecasts_url, as: :json
    assert_response :success
  end

  test 'should create forecast' do
    assert_difference('Forecast.count') do
      post forecasts_url, params: { forecast: @forecast }, as: :json
    end

    assert_response 201
  end

  test 'should show forecast' do
    get forecast_url(@forecast), as: :json
    assert_response :success
  end

  test 'should update forecast' do
    patch forecast_url(@forecast), params: { forecast: @forecast }, as: :json
    assert_response 200
  end

  test 'should destroy forecast' do
    assert_difference('Forecast.count', -1) do
      delete forecast_url(@forecast), as: :json
    end

    assert_response 204
  end
end
