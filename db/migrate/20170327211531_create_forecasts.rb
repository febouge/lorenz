# Migration for 2017-03-27 - FORCASTS
class CreateForecasts < ActiveRecord::Migration[5.0]
  def change
    create_table :forecasts do |t|
      t.date :forecast_day
      t.date :forecast_obtained

      t.timestamps
    end
  end
end
