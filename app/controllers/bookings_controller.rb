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

  # /bookings/
  def show
    @tour = Tour.find(params[:id])
  end

  # solo dejar ingrsar a estas vistas un usario logeado
  def index
    @bookings = current_user.bookings

  end
end
