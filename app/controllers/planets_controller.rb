class PlanetsController < ApplicationController

    def slug
        @planet = Planet.find_by_slug(params[:slug])
        render "/planets/show"
    end
end
