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

    def show 
        if !session[:user_id] 
            redirect_to "/"
        else
            current_trip = Trip.find(params[:id])
            @trip = {
                origin: Planet.find(current_trip.origin_id), 
                destination: Planet.find(current_trip.destination_id), 
                rocket: current_trip.rocket, 
                carrier: current_trip.carrier, 
                distance: Planet.find(current_trip.origin_id).distance_from_earth + Planet.find(current_trip.destination_id).distance_from_earth,                     duration: (Planet.find(current_trip.origin_id).distance_from_earth + Planet.find(current_trip.destination_id).distance_from_earth)/current_trip.rocket.speed}
        end 
    end 
end
