class ReviewsController < ApplicationController
  def create
    @review = Review.new(find_params)
    @review.user = current_user
    @review.booking = Booking.find(params[:booking_id])
    if @review.save
      redirect_to tour_path(@review.booking.tour_id)
    else
      # renderizar los errores en caso exista falla
    end
  end

  private

  def find_params
    params.require(:review).permit(
      :content,
      :rating,
      photos: []
    )
  end
end
