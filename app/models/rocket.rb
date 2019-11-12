class Rocket < ApplicationRecord
    has_many :trips 
    has_many :planets, through: :trips
    has_many :carriers, through: :trips
end
