class StartPointsController < ApplicationController
  def autocomplete_stations
    render json: StartPoint.select(:station).search_by_station(params[:search][:start_point]).map(&:station)
  end
end
