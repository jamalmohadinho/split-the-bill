class CreateTripParticipants < ActiveRecord::Migration[7.2]
  def change
    create_table :trip_participants do |t|
      t.integer :trip_id
      t.integer :user_id

      t.timestamps
    end

    add_foreign_key :trip_participants, :trips
    add_foreign_key :trip_participants, :users
    add_index :trip_participants, [:trip_id, :user_id], unique: true
  end
end
