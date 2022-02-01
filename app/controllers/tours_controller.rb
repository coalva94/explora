class ToursController < ApplicationController

  def index
    @tours = Tour.all
  end

  def show
    @tour = Tour.find(params[:id])
    @booking = Booking.new
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(find_params)
    @tour.agency = current_user
    # authorize @car
    if @tour.save
      redirect_to tours_path
    else
      render :new
    end
  end

  def edit
    @tour = Tour.find(params[:id])
    # authorize @car
  end

  def update
    @tour = Tour.find(params[:id])
    # authorize @car
    @tour.update(find_params)
    if @tour.save
      redirect_to tours_path
    else
      render :edit
    end
  end

  def destroy
    @tour = Tour.find(params[:id])
    # authorize @car
    @tour.destroy
    redirect_to tours_path
  end

  private

  def find_params
    params.require(:tour).permit(
      :price,
      :destination,
      :title_tour,
      :description,
      :duration,
      # photos: []
    )
  end

end
