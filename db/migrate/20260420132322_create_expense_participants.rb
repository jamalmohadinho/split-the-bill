class CreateExpenseParticipants < ActiveRecord::Migration[7.2]
  def change
    create_table :expense_participants do |t|
      t.integer :expense_id
      t.integer :user_id

      t.timestamps
    end

    add_foreign_key :expense_participants, :expenses
    add_foreign_key :expense_participants, :users
    add_index :expense_participants, [ :expense_id, :user_id ], unique: true
  end
end
