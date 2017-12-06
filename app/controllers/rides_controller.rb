class RidesController < ApplicationController

  before_action :set_ride, only: :show
  skip_before_action :authenticate_user!, only: :index
  skip_before_action :authenticate_user!, only: :show

  def index
    @rides = Ride.all
    search_params = params[:search]
    raise




        # On filtre les rides dont :
        # le start point est la gare d'arrivée matchent
        # le jour du ride match avec le jour cherché.
        # l'heure du ride est postérieur ou égale à l'heure cherché

            # if no matching return : désolé il n'y a pas de trajet au départ
            # de votre gare

            #else
              # select les rides dont le num de train est egal au num du train
              # du formulaire
              # return ces rides en fonction par distance croissante
              # entre (destination final form et destination final ride)






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
