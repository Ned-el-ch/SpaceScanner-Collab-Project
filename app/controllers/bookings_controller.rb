class BookingsController < ApplicationController

    def index

        # @trips = []

        @valid_trips = Trip.where(origin_id: params[:origin_id], destination_id: params[:destination_id])
        # @trips = {
        #     origin: Planet.find(params[:origin_id]), 
        #     destination: Planet.find(params[:destination_id]),
        #     date: "#{params[:date_takeoff_date_1i]}-#{params[:date_takeoff_date_2i]}-#{params[:date_takeoff_date_3i]}"
        # }

        @trips = []
        @valid_trips.each_with_index do |trip, index|
            @trips << {
                origin: Planet.find(trip.origin_id), 
                destination: Planet.find(trip.destination_id), 
                rocket: trip.rocket, 
                carrier: trip.carrier, 
                distance: Planet.find(trip.origin_id).distance_from_earth + Planet.find(trip.destination_id).distance_from_earth, 
                duration: Planet.find(trip.destination_id).distance_from_earth/trip.rocket.speed}
            
        end
        # byebug
        render "/trips/_trips"
    end 

end
