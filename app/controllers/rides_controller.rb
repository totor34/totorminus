class RidesController < ApplicationController

  before_action :set_ride, only: :show
  skip_before_action :authenticate_user!, only: :index
  skip_before_action :authenticate_user!, only: :show

  def index
    # @rides = Ride.all
    @search_params = params[:search]

    passenger_number = @search_params[:passenger_number].to_i

    if @search_params[:start_point].blank?
      flash[:alert] = "Veuillez remplir le point de départ !"
      redirect_to root_path
    end

    matching_train = @search_params[:train_ref]
    filters = {
      start_points: { station: @search_params[:start_point]},
      passengers_allowed: passenger_number..10
    }

    if params[:train_arrival_at].present?

      arrival_at = params[:train_arrival_at].to_datetime
      filters[:train_arrival_at] = arrival_at..arrival_at.tomorrow.at_midnight
    end

    rides = Ride.joins(:start_point).where(filters).order(:train_arrival_at)

    @rides_same_train = rides.select do |ride|
      ride.train_ref == matching_train
    end

    @rides_not_same_train = rides - @rides_same_train

  end

        # On filtre les rides dont :
        # le start point et la gare d'arrivée matchent
        # le jour du ride match avec le jour cherché.
        # l'heure du ride est postérieur ou égale à l'heure cherché
        # le passenger allowed est superieur ou egal au passager number dans search

            # if no matching return : désolé il n'y a pas de trajet au départ
            # de votre gare

            #else
              # select les rides dont le num de train est egal au num du train
              # du formulaire
              # return ces rides en fonction par distance croissante
              # entre (destination final form et destination final ride)

  def show

    points = [@ride.start_point, @ride.end_point]

    @markers = Gmaps4rails.build_markers(points) do |point, marker|
      marker.lat point.lat
      marker.lng point.long
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    @booking = Booking.new
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
      :train_ref, :train_arrival_at, :user_id, :passengers_allowed, :start_point_id, :end_point_id,
      :description, :start_date, :car_model, :car_brand
    )
  end
end
