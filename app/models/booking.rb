class Booking < ApplicationRecord
  belongs_to :trek
  belongs_to :user
end
