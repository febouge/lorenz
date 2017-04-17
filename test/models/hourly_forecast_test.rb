require 'test_helper'

class HourlyForecastTest < ActiveSupport::TestCase
  # Sunrise
  test 'does not allow blank sunrise' do
    hourly_forecast = HourlyForecast.new(sunrise: ' ')
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:sunrise)[0]
  end

  test 'does not nil sunrise' do
    hourly_forecast = HourlyForecast.new(sunrise: nil)
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:sunrise)[0]
  end

  test 'does not allow less than length 5 for sunrise' do
    hourly_forecast = HourlyForecast.new(sunrise: 'test')
    hourly_forecast.valid?
    assert_match 'is the wrong length (should be 5 characters)',
                 hourly_forecast.errors.full_messages_for(:sunrise)[0]
  end

  test 'does not allow more than length 5 for sunrise' do
    hourly_forecast = HourlyForecast.new(sunrise: 'testtest')
    hourly_forecast.valid?
    assert_match 'is the wrong length (should be 5 characters)',
                 hourly_forecast.errors.full_messages_for(:sunrise)[0]
  end

  test 'does allow length 5 for sunrise' do
    hourly_forecast = HourlyForecast.new(sunrise: '05:04')
    hourly_forecast.valid?
    refute(hourly_forecast.errors.include?(:sunrise))
  end

  # Sunset
  test 'does not allow blank sunset' do
    hourly_forecast = HourlyForecast.new(sunset: ' ')
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:sunset)[0]
  end

  test 'does not nil sunset' do
    hourly_forecast = HourlyForecast.new(sunset: nil)
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:sunset)[0]
  end

  test 'does not allow less than length 5 for sunset' do
    hourly_forecast = HourlyForecast.new(sunset: 'test')
    hourly_forecast.valid?
    assert_match 'is the wrong length (should be 5 characters)',
                 hourly_forecast.errors.full_messages_for(:sunset)[0]
  end

  test 'does not allow more than length 5 for sunset' do
    hourly_forecast = HourlyForecast.new(sunset: 'testtest')
    hourly_forecast.valid?
    assert_match 'is the wrong length (should be 5 characters)',
                 hourly_forecast.errors.full_messages_for(:sunset)[0]
  end

  test 'does allow length 5 for sunset' do
    hourly_forecast = HourlyForecast.new(sunset: '05:04')
    hourly_forecast.valid?
    refute(hourly_forecast.errors.include?(:sunset))
  end

  # Period
  test 'does not allow non numerical values for period' do
    hourly_forecast = HourlyForecast.new(period: 'foo')
    hourly_forecast.valid?
    assert_match 'is not a number', hourly_forecast.errors.full_messages_for(:period)[0]
  end

  test 'does not allow blank period' do
    hourly_forecast = HourlyForecast.new(period: '  ')
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:period)[0]
  end

  test 'does not nil period' do
    hourly_forecast = HourlyForecast.new(period: nil)
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:period)[0]
  end

  test 'allows numerical values for period' do
    hourly_forecast = HourlyForecast.new(period: 3)
    hourly_forecast.valid?
    refute(hourly_forecast.errors.include?(:period))
  end

  # Sky state
  test 'does not allow blank sky state' do
    hourly_forecast = HourlyForecast.new(sky_state: '  ')
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:sky_state)[0]
  end

  test 'does not nil sky state' do
    hourly_forecast = HourlyForecast.new(sky_state: nil)
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:sky_state)[0]
  end

  # Rain
  test 'does not allow non numerical values for rain' do
    hourly_forecast = HourlyForecast.new(rain: 'foo')
    hourly_forecast.valid?
    assert_match 'is not a number', hourly_forecast.errors.full_messages_for(:rain)[0]
  end

  test 'does not allow blank rain' do
    hourly_forecast = HourlyForecast.new(rain: '  ')
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:rain)[0]
  end

  test 'does not nil rain' do
    hourly_forecast = HourlyForecast.new(rain: nil)
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:rain)[0]
  end

  test 'allows numerical values for rain' do
    hourly_forecast = HourlyForecast.new(rain: 3)
    hourly_forecast.valid?
    refute(hourly_forecast.errors.include?(:rain))
  end

  # Rain probability
  test 'does not allow non numerical values for rain probability' do
    hourly_forecast = HourlyForecast.new(rain_probability: 'foo')
    hourly_forecast.valid?
    assert_match 'is not a number', hourly_forecast.errors.full_messages_for(:rain_probability)[0]
  end

  test 'does not allow blank rain probability' do
    hourly_forecast = HourlyForecast.new(rain_probability: '  ')
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:rain_probability)[0]
  end

  test 'does not nil rain probability' do
    hourly_forecast = HourlyForecast.new(rain_probability: nil)
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:rain_probability)[0]
  end

  test 'allows numerical values for rain probability' do
    hourly_forecast = HourlyForecast.new(rain_probability: 3)
    hourly_forecast.valid?
    refute(hourly_forecast.errors.include?(:rain_probability))
  end

  # Storm probability
  test 'does not allow non numerical values for storm probability' do
    hourly_forecast = HourlyForecast.new(storm_probability: 'foo')
    hourly_forecast.valid?
    assert_match 'is not a number', hourly_forecast.errors.full_messages_for(:storm_probability)[0]
  end

  test 'does not allow blank storm probability' do
    hourly_forecast = HourlyForecast.new(storm_probability: '  ')
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:storm_probability)[0]
  end

  test 'does not nil storm probability' do
    hourly_forecast = HourlyForecast.new(storm_probability: nil)
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:storm_probability)[0]
  end

  test 'allows numerical values for storm probability' do
    hourly_forecast = HourlyForecast.new(storm_probability: 3)
    hourly_forecast.valid?
    refute(hourly_forecast.errors.include?(:storm_probability))
  end
  # Snow
  test 'does not allow non numerical values for snow' do
    hourly_forecast = HourlyForecast.new(snow: 'foo')
    hourly_forecast.valid?
    assert_match 'is not a number', hourly_forecast.errors.full_messages_for(:snow)[0]
  end

  test 'does not allow blank snow' do
    hourly_forecast = HourlyForecast.new(snow: '  ')
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:snow)[0]
  end

  test 'does not nil snow' do
    hourly_forecast = HourlyForecast.new(snow: nil)
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:snow)[0]
  end

  test 'allows numerical values for snow' do
    hourly_forecast = HourlyForecast.new(snow: 3)
    hourly_forecast.valid?
    refute(hourly_forecast.errors.include?(:snow))
  end

  # Snow probability
  test 'does not allow non numerical values for snow proability' do
    hourly_forecast = HourlyForecast.new(snow_probability: 'foo')
    hourly_forecast.valid?
    assert_match 'is not a number', hourly_forecast.errors.full_messages_for(:snow_probability)[0]
  end

  test 'does not allow blank snow proability' do
    hourly_forecast = HourlyForecast.new(snow_probability: '  ')
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:snow_probability)[0]
  end

  test 'does not nil snow proability' do
    hourly_forecast = HourlyForecast.new(snow_probability: nil)
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:snow_probability)[0]
  end

  test 'allows numerical values for snow proability' do
    hourly_forecast = HourlyForecast.new(snow_probability: 3)
    hourly_forecast.valid?
    refute(hourly_forecast.errors.include?(:snow_probability))
  end

  # Thermal sensation
  test 'does not allow non numerical values for thermal sensation' do
    hourly_forecast = HourlyForecast.new(thermal_sensation: 'foo')
    hourly_forecast.valid?
    assert_match 'is not a number', hourly_forecast.errors.full_messages_for(:thermal_sensation)[0]
  end

  test 'does not allow blank thermal sensation' do
    hourly_forecast = HourlyForecast.new(thermal_sensation: '  ')
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:thermal_sensation)[0]
  end

  test 'does not nil thermal sensation' do
    hourly_forecast = HourlyForecast.new(thermal_sensation: nil)
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:thermal_sensation)[0]
  end

  test 'allows numerical values for thermal sensation' do
    hourly_forecast = HourlyForecast.new(thermal_sensation: 3)
    hourly_forecast.valid?
    refute(hourly_forecast.errors.include?(:thermal_sensation))
  end

  # Relative humidity
  test 'does not allow non numerical values for relative humidity' do
    hourly_forecast = HourlyForecast.new(relative_humidity: 'foo')
    hourly_forecast.valid?
    assert_match 'is not a number', hourly_forecast.errors.full_messages_for(:relative_humidity)[0]
  end

  test 'does not allow blank relative humidity' do
    hourly_forecast = HourlyForecast.new(relative_humidity: '  ')
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:relative_humidity)[0]
  end

  test 'does not nil relative humidity' do
    hourly_forecast = HourlyForecast.new(relative_humidity: nil)
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:relative_humidity)[0]
  end

  test 'allows numerical values for relative humidity' do
    hourly_forecast = HourlyForecast.new(relative_humidity: 3)
    hourly_forecast.valid?
    refute(hourly_forecast.errors.include?(:relative_humidity))
  end

  # Wind velocity
  test 'does not allow non numerical values for wind velocity' do
    hourly_forecast = HourlyForecast.new(wind_velocity: 'foo')
    hourly_forecast.valid?
    assert_match 'is not a number', hourly_forecast.errors.full_messages_for(:wind_velocity)[0]
  end

  test 'does not allow blank wind velocity' do
    hourly_forecast = HourlyForecast.new(wind_velocity: '  ')
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:wind_velocity)[0]
  end

  test 'does not nil wind velocity' do
    hourly_forecast = HourlyForecast.new(wind_velocity: nil)
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:wind_velocity)[0]
  end

  test 'allows numerical values for wind velocity' do
    hourly_forecast = HourlyForecast.new(wind_velocity: 3)
    hourly_forecast.valid?
    refute(hourly_forecast.errors.include?(:wind_velocity))
  end

  # Wind direction
  test 'does not allow blank wind direction' do
    hourly_forecast = HourlyForecast.new(wind_direction: '')
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:wind_direction)[0]
  end

  test 'does not nil wind direction' do
    hourly_forecast = HourlyForecast.new(wind_direction: nil)
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:wind_direction)[0]
  end

  test 'does not allow more than 2 characters for wind direction' do
    hourly_forecast = HourlyForecast.new(wind_direction: 'OSE')
    hourly_forecast.valid?
    assert_match 'is too long (maximum is 2 characters)',
                 hourly_forecast.errors.full_messages_for(:wind_direction)[0]
  end

  test 'allow 2-characters string for wind direction' do
    hourly_forecast = HourlyForecast.new(wind_direction: 'SO')
    hourly_forecast.valid?
    refute(hourly_forecast.errors.include?(:wind_direction))
  end

  test 'allow 1-characters string for wind direction' do
    hourly_forecast = HourlyForecast.new(wind_direction: 'E')
    hourly_forecast.valid?
    refute(hourly_forecast.errors.include?(:wind_direction))
  end

  # Temperature
  test 'does not allow non numerical values for temperature' do
    hourly_forecast = HourlyForecast.new(temperature: 'foo')
    hourly_forecast.valid?
    assert_match 'is not a number', hourly_forecast.errors.full_messages_for(:temperature)[0]
  end

  test 'does not allow blank temperature' do
    hourly_forecast = HourlyForecast.new(temperature: '  ')
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:temperature)[0]
  end

  test 'does not nil temperature' do
    hourly_forecast = HourlyForecast.new(temperature: nil)
    hourly_forecast.valid?
    assert_match "can't be blank", hourly_forecast.errors.full_messages_for(:temperature)[0]
  end

  test 'allows numerical values for temperature' do
    hourly_forecast = HourlyForecast.new(temperature: 3)
    hourly_forecast.valid?
    refute(hourly_forecast.errors.include?(:temperature))
  end
end
