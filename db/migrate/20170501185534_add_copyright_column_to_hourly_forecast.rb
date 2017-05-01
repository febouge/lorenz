class AddCopyrightColumnToHourlyForecast < ActiveRecord::Migration[5.0]
  def change
    add_column :hourly_forecasts, :copyright, :string, default: '© AEMET'
  end
end
