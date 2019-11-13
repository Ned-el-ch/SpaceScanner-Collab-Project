require_relative "./concerns/slugifiable"

class Planet < ApplicationRecord
    has_many :trips 
    has_many :carriers, through: :trips
    has_many :rockets, through: :trips

    include Slugifiable
end
