require 'test_helper'

class WindTest < ActiveSupport::TestCase
  setup do
    @valid_wind = winds(:valid)
  end

  test 'valid_wind is valid' do
    @valid_wind.valid?
    refute(@valid_wind.errors.include?(:period))
    refute(@valid_wind.errors.include?(:velocity))
    refute(@valid_wind.errors.include?(:direction))
  end

  test 'does not allow more than two digits for direction' do
    wind = Wind.new(direction: 'NOVALID')
    wind.valid?
    assert_match 'is too long (maximum is 2 characters)',
                 wind.errors.full_messages_for(:direction)[0]
  end

  test 'allows two digits string for direction' do
    wind = Wind.new(direction: 'NO')
    wind.valid?
    refute(wind.errors.include?(:direction))
  end

  test 'allows blank string for direction' do
    wind = Wind.new(direction: '')
    wind.valid?
    refute(wind.errors.include?(:direction))
  end

  test 'does not allow non numbers for velocity' do
    wind = Wind.new(velocity: 'no valid')
    wind.valid?
    assert_match 'is not a number', wind.errors.full_messages_for(:velocity)[0]
  end

  test 'allows numerical values for velocity' do
    wind = Wind.new(velocity: 3)
    wind.valid?
    refute(wind.errors.include?(:velocity))
  end

  test 'allows blank values for velocity' do
    wind = Wind.new(velocity: '')
    wind.valid?
    refute(wind.errors.include?(:velocity))
  end

  private

  def create_valid_wind
    valid_wind = Wind.new
    valid_wind.direction = 'NO'
    valid_wind.velocity = 2
    valid_wind.period = '00-06'
    valid_wind.forecast_id = forecasts(:one).id
    valid_wind
  end
end
