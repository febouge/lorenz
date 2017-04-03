# Migration for 2017-03-27 - WINDS TO FORECAST FOREIGN KEY
class AddForecastToWind < ActiveRecord::Migration[5.0]
  def change
    add_reference :winds, :forecast, foreign_key: true
  end
end
