class Trip < ApplicationRecord
    belongs_to :carrier#, :planet, :rocket
    belongs_to :rocket
    has_many :bookings 
    has_many :users, through: :bookings 
end
