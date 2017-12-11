class PaymentsController < ApplicationController
  before_action :set_order



  def create
  customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
  )

  charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @booking.calculate_amount.cents,
    description:  "Paiement pour votre trajet",
    currency:     "eur"
  )

  @booking.update(payment: charge.to_json, state: 'paid')
  redirect_to booking_path(@booking)

  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_booking_payment_path(@booking)

  end




private

  def set_order
    @booking = Booking.where(state: 0).find(params[:booking_id])
  end
end






