class PlanetsController < ApplicationController

    def slug
        # byebug
        name = params[:slug].gsub(" ", "-").downcase
        # byebug
        @planet = Planet.find_by_slug(name)
        render "/planets/show"
    end
end
