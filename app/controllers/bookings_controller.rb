class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @tour = Tour.find(params[:tour_id])
  end

  def create
    # @tour = Tour.find(params[:tour_id])
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

  def show
    @bookings = Booking.find(params[:id])
  end

  def edit

  end

  def update
    @tour = Tour.update(find_params)
    redirect_to @tour, notice: "El booking ha sido modificado"
  end


  def destroy
    @bookings = Booking.find(params[:id])
    @bookings.destroy
    redirect_to bookings_path
  end



  private

  def find_params
    params.require(:booking).permit(
      :start_date,
      :quantity
    )
  end
end
