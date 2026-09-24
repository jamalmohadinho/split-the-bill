class CreateTrips < ActiveRecord::Migration[7.2]
  def change
    create_table :trips do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.integer :creator_id

      t.timestamps
    end

    add_foreign_key :trips, :users, column: :creator_id
  end
end
