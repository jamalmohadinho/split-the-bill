class Trip < ApplicationRecord
  belongs_to :creator, class_name: "User"
  has_many :trip_participants
  has_many :participants, through: :trip_participants, source: :user
  has_many :expenses

  validates :name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?
    if end_date < start_date
      errors.add(:end_date, "must be after start date")
    end
  end
end
