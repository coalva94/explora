class BookingsController < ApplicationController
  def create
    @booking = Booking.new(find_params)
    @booking.user = current_user
    @booking.tour = Tour.find(params[:tour_id])

    if @booking.save
      redirect_to booking_path
    else
      render :new
    end
  end
end
