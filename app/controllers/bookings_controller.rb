class BookingsController < ApplicationController

    def index

        @trips = []

        @trips << Trip.find_by(origin_id: params[:origin_id], destination_id: params[:destination_id])
        # @trips = {
        #     origin: Planet.find(params[:origin_id]), 
        #     destination: Planet.find(params[:destination_id]),
        #     date: "#{params[:date_takeoff_date_1i]}-#{params[:date_takeoff_date_2i]}-#{params[:date_takeoff_date_3i]}"
        # }
        byebug
        render "/trips/_trips"
    end 

end
