class TripsController < ApplicationController
    # def trips
    # end

    def index 
        if !session[:user_id] 
            redirect_to "/"
        else
            @user = User.find(session[:user_id])
            @trips = []
            @user.trips.each_with_index do |trip, index|
                @trips << {
                    origin: Planet.find(trip.origin_id), 
                    destination: Planet.find(trip.destination_id), 
                    rocket: trip.rocket, 
                    carrier: trip.carrier, 
                    distance: Planet.find(trip.origin_id).distance_from_earth + Planet.find(trip.destination_id).distance_from_earth, 
                    duration: Planet.find(trip.origin_id).distance_from_earth + Planet.find(trip.destination_id).distance_from_earth/trip.rocket.speed}
                
            end

        end 
    end 
end
