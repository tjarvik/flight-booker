class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.string :from_airport_id
      t.string :to_airport_id
      t.datetime :departure
      t.integer :duration

      t.timestamps
    end
  end
end
