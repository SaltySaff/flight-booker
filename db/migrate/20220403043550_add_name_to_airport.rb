class AddNameToAirport < ActiveRecord::Migration[6.1]
  def change
    add_column :airports, :name, :string
  end
end
