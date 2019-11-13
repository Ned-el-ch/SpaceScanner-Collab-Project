class RocketsController < ApplicationController

    def slug
        name = params[:slug].gsub(" ", "-").downcase
        @rocket = Rocket.find_by_slug(name)
        if @rocket 
            render "/rockets/show"
        else 
            redirect_to trips_path
        end 
    end 
end
