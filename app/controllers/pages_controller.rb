class PagesController < ApplicationController
  def home
    @tours_near = Tour.all
    if params[:query].present?
      sql_query = "\
      tours.title_tour ILIKE :query\
      OR tours.description ILIKE :query\
      OR tours.duration ILIKE :query\
      OR agencies.name ILIKE :query\
      "
      @tours = Tour.joins(:agency).where(sql_query, query: "%#{params[:query]}%")
    else
      @tours = Tour.all
    end
  end
end
