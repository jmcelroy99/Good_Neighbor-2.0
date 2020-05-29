class BookingsController < ApplicationController
    def index
        renter_id = session[:renter_id]
        @bookings = Booking.all
    end
    
    def new
        @booking = Booking.new
    end

    def create
        renter_id = session[:renter_id]
        appliance_id = params[:booking][:appliance_id].to_i
        @booking = Booking.new(renter_id: renter_id, appliance_id: appliance_id)
        if @booking.save
            @booking.appliance.rented_out
            redirect_to renter_path(renter_id)
        else
            flash[:errors] = @booking.errors.full_messages
            redirect_to new_booking_url
        end
    end

    def destroy
        @renter = Booking.find(params[:id]).renter_id
        @booking = Booking.find(params[:id])
        @booking.appliance.returned
        @booking.destroy
        redirect_to renter_path(@renter)
    end

    private

    def booking_params
        params.require(:booking).permit(:appliance_id, :renter_id)
    end
end
