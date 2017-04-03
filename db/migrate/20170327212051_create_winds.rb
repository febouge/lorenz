# Migration for 2017-03-27 - WINDS
class CreateWinds < ActiveRecord::Migration[5.0]
  def change
    create_table :winds do |t|
      t.string :direction
      t.integer :velocity
      t.string :period

      t.timestamps
    end
  end
end
