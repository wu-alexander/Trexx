class Trek < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, :description, :start_location, :difficulty, :duration_days, :price, presence: true
end
