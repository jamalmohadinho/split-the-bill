class CreateExpenses < ActiveRecord::Migration[7.2]
  def change
    create_table :expenses do |t|
      t.integer :trip_id
      t.integer :paid_by_id
      t.string :description
      t.decimal :amount
      t.date :date
      t.string :category

      t.timestamps
    end

    add_foreign_key :expenses, :trips
    add_foreign_key :expenses, :users, column: :paid_by_id
  end
end
