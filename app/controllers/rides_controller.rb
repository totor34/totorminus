class RidesController < ApplicationController

  before_action :set_ride, only: :show
  skip_before_action :authenticate_user!, only: :index
  skip_before_action :authenticate_user!, only: :show

  def index
    @rides = Ride.all

  end

  def show

    points = [@ride.start_point, @ride.end_point]

    @markers = Gmaps4rails.build_markers(points) do |point, marker|
      marker.lat point.lat
      marker.lng point.long
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_ride
    @ride = Ride.find(params[:id])
  end

  def ride_params
    params.require(:ride).permit(
      :train_ref, :train_arrival_time, :train_arrival_date, :user_id, :passengers_allowed, :start_point_id, :end_point_id,
      :description, :start_date, :car_model, :car_brand
    )
  end
end
