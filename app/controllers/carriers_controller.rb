class CarriersController < ApplicationController

    def slug 
        name = params[:slug].gsub(" ", "-").downcase
        @carrier = Carrier.find_by_slug(name)
        render "/carriers/show"
    end 
end
