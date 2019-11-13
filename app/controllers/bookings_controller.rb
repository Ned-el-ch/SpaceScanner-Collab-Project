class BookingsController < ApplicationController

    def index
        @booking = {
            origin: Planet.find(params[:origin_id]), 
            destination: Planet.find(params[:destination_id]),
            date: "#{params[:date_takeoff_date_1i]}-#{params[:date_takeoff_date_2i]}-#{params[:date_takeoff_date_3i]}"
        }
        byebug
    end 

end
