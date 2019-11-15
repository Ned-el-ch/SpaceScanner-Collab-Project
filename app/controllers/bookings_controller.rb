class BookingsController < ApplicationController

    def index

        @valid_trips = Trip.where(origin_id: params[:origin_id], destination_id: params[:destination_id])

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

        render "/trips/_trips"
    end 

    def new

        if current_user

            booking = Booking.new

            booking.user = current_user
            booking.trip = Trip.find(params[:trip][:id])
            booking.price = Trip.find(params[:trip][:price])
            booking.rating = 5
            current_user.sparklegasm -= params[:trip][:price].to_i
byebug
            current_user.save
byebug
            booking.save

            redirect_to trips_path

        else

            redirect_to login_path

        end
    end

end
