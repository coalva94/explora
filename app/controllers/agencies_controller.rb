class AgenciesController < ApplicationController
  def show
    @agency = Agency.find(params[:id])
    @tours = Tours.where(agency_id: params[:id])
  end


end
