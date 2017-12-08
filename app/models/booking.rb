# == Schema Information
#
# Table name: bookings
#
#  id               :integer          not null, primary key
#  ride_id          :integer
#  user_id          :integer
#  passenger_number :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Booking < ApplicationRecord
  belongs_to :ride
  belongs_to :user

  validates :passenger_number, presence: true, inclusion: { in: (0..10),
    message: "Must be a number between 0 and 10"}

  # enables to call end_point on @booking and returns @booking.ride.end_point
  delegate :end_point, :start_point, to: :ride
  enum state: [:pending , :paid ]
  monetize :amount_cents




  # other possibility to avoid doing a belongs_to:end_point through :ride is :
  # def end_point
  #   ride.end_point
  # end

  # def start_point
  #   ride.start_point
  # end

end
