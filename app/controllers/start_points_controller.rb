class StartPointsController < ApplicationController
  skip_before_action :authenticate_user!, only: :autocomplete_stations

  def autocomplete_stations
    render json: StartPoint.select(:station).search_by_station(params[:search][:start_point]).map(&:station)
  end
end
