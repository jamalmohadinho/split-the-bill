class Expense < ApplicationRecord
  belongs_to :trip
  belongs_to :paid_by, class_name: "User"
  has_many :expense_participants
  has_many :participants, through: :expense_participants, source: :user

  validates :description, presence: true
  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :date, presence: true
end