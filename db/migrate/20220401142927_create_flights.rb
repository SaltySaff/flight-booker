class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.references :departure_airport, index: true, foreign_key: { to_table: :airport }
      t.references :arrival_airport, index: true, foreign_key: { to_table: :airport }
      t.datetime :departure_datetime
      t.integer :duration
      t.timestamps
    end
  end
end
