class Booking < ApplicationRecord
  belongs_to :trek
  belongs_to :user

  validates :start_on, :num_trekkers, presence: true
end
