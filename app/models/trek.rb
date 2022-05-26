class Trek < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :name, :description, :start_location, :difficulty, :duration_days, :price, presence: true
end
