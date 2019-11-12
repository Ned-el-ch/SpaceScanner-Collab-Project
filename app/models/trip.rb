class Trip < ApplicationRecord
    belongs_to :carrier, :planet, :rocket
    has_many :bookings 
    has_many :users, through: :bookings 
end
