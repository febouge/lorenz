class CreateHourlyForecasts < ActiveRecord::Migration[5.0]
  def change
    create_table :hourly_forecasts do |t|
      t.date :day
      t.string :sunrise
      t.string :sunset
      t.integer :period
      t.string :sky_state
      t.integer :rain
      t.integer :rain_probability
      t.integer :storm_probability
      t.integer :snow
      t.integer :snow_probability
      t.integer :thermal_sensation
      t.integer :relative_humidity
      t.integer :wind_velocity
      t.string :wind_direction
      t.integer :temperature
      t.timestamps
    end
  end
end
