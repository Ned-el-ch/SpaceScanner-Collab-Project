class Rocket < ApplicationRecord
    require_relative "./concerns/slugifiable"
    
    has_many :trips 
    has_many :planets, through: :trips
    has_many :carriers, through: :trips

    include Slugifiable
end
