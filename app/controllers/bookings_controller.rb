class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @tour = Tour.find(params[:tour_id])
  end

  def create
    # @tour = Tour.find(params[:tour_id])
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

  def show
    @bookings = Booking.find(params[:id])
    @companion = Companion.new
    @review = Review.new
    @companions = Companion.where(booking_id: @bookings.id)

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Post id: #{@bookings.id}", template: "bookings/show.html.erb", layout: "pdf"   # Excluding ".pdf" extension.
      end
    end
  end


  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(find_params)
    if @booking.save
      redirect_to booking_path(@booking), notice: "El booking ha sido modificado"
    else
      render :edit
    end
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
