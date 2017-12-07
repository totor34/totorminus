class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @ride = Ride.find(params[:ride_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.ride = @ride
    if @booking.save
      redirect_to booking_path(@booking.id)
    else
      render 'rides/show'
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  private

  def booking_params
    params.require(:booking).permit(:ride_id, :user_id, :passenger_number)
  end

end