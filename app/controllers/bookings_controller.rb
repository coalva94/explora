class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @tour = Tour.find(params[:tour_id])
  end

  def create
    @tour = Tour.find(params[:tour_id])
    @booking = Booking.new(find_params)
    @booking.user = current_user
    @booking.tour = Tour.find(params[:tour_id])

    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  # /bookings/

  # solo dejar ingrsar a esas vistas un usario logeado
  def index
    @bookings = current_user.bookings
  end

  def find_params
    params.require(:booking).permit(
      :start_date,
      :quantity,
    )
  end

end
