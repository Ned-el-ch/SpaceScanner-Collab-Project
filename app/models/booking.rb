class Booking < ApplicationRecord
    belongs_to :user, :trip
end
