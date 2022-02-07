class AgenciesController < ApplicationController
  def show
    @agency = Agency.find(params[:id])
    @tours = Tour.where(agency_id: @agency.id)
  end

  def new
    @agency = Agency.new
  end

  def create
    @agency = Agency.new(find_params)
    @agency.user = current_user

    if @agency.save
      redirect_to agency_path(@agency)
    else
      render :new
    end
  end

  private

  def find_params
    params.require(:agency).permit(
      :name,
      :email,
      :tax_number,
      :address,
      :state,
      :id,
      :latitude,
      :longitude
    )
  end
end
