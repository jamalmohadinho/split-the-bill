class User < ApplicationRecord
  has_secure_password

  has_many :trip_participants
  has_many :trips, through: :trip_participants
  has_many :trips, class_name: "Trip", foreign_key: :creator_id
  has_many :paid_expenses, class_name: "Expense", foreign_key: :paid_by_id
  has_many :expense_participants
  has_many :shared_expenses, through: :expense_participants, source: :expense

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }
end
