# == Schema Information
#
# Table name: rides
#
#  id                 :integer          not null, primary key
#  train_ref          :string
#  train_arrival_date :date
#  user_id            :integer
#  passengers_allowed :integer
#  start_point_id     :integer
#  end_point_id       :integer
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  train_arrival_time :time
#  car_brand          :string
#  car_model          :string
#

class Ride < ApplicationRecord
  belongs_to :user
  belongs_to :start_point
  belongs_to :end_point
  has_many :bookings

  validates :train_ref, presence: true
  validates :train_arrival_at, presence: true
  validates :passengers_allowed, presence: true, inclusion: { in: (0..10), message: "Entrer un entier entre 0 et 10"}
  validates :description, presence: true

end

