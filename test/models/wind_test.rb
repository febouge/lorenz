require 'test_helper'

class WindTest < ActiveSupport::TestCase
  setup do
    @valid_wind = create_valid_wind
    @not_valid_wind = create_not_valid_wind
  end

  test 'valid_wind is valid' do
    assert @valid_wind.valid?
  end

  test 'valid_wind can be persisted' do
    assert @valid_wind.save
    assert @valid_wind.persisted?
  end

  test 'does not allow non numerical values for velocity' do
    wind = Wind.new(velocity: 'foo')
    wind.valid?
    assert_match 'is not a number', wind.errors.full_messages_for(:velocity)[0]
  end

  test 'allows numerical values for velocity' do
    wind = Wind.new(velocity: 3)
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

  def create_not_valid_wind
    not_valid_wind = Wind.new
    not_valid_wind.velocity = 'testNumber'
    not_valid_wind.direction = '123'
    not_valid_wind
  end
end
