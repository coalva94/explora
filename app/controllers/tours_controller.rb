class ToursController < ApplicationController
  def index
    if params[:query].present?
      sql_query = "\
      tours.title_tour ILIKE :query\
      OR tours.description ILIKE :query\
      OR tours.duration ILIKE :query\
      OR agencies.name ILIKE :query\
      OR tours.destination ILIKE :query\
      "
      @tours = Tour.joins(:agency).where(sql_query, query: "%#{params[:query]}%")
      @markers = Tour.near(params[:query]).map do |tour|
        {
          lat: tour.latitude,
          lng: tour.longitude,
          info_window: render_to_string(partial: "info_window", locals: { tour: tour })
        }
      end

    else
      @tours = Tour.all
      @markers = Tour.geocoded.map do |tour|
        {
          lat: tour.latitude,
          lng: tour.longitude,
          info_window: render_to_string(partial: "info_window", locals: { tour: tour })
        }
      end
    end
  end

  def show
    @tour = Tour.find(params[:id])
    @booking = Booking.new
    @tours = Tour.where.not(title_tour: @tour.title_tour)
  end

  def new
    @tour = Tour.new
    @tour.agency = current_user.agency
  end

  def create
    @tour = Tour.new(find_params)
    @tour.agency = current_user.agency

    if @tour.save
      redirect_to my_tours_agency_path
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
      redirect_to my_tours_agency_path
    else
      render :edit
    end
  end

  def destroy
    @tour = Tour.find(params[:id])
    # authorize @car
    @tour.destroy
    redirect_to my_tours_agency_path
  end

  private

  def find_params
    params.require(:tour).permit(
      :price,
      :destination,
      :title_tour,
      :description,
      :duration,
      :services,
      :departure,
      :expectation,
      :additional_info,
      :cancellation,
      :faq,
      photos: []
    )
  end
end
