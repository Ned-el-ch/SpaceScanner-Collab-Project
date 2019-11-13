class Carrier < ApplicationRecord
    has_many :trips
    has_many :planets, through: :trips
    has_many :rockets, through: :trips

    include Slugifiable
end
