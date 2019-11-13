class RocketsController < ApplicationController

    def slug
        name = params[:slug].gsub(" ", "-").downcase
        @rocket = Rocket.find_by_slug(name)
        render "/rockets/show"
    end 
end
