# == Schema Information
#
# Table name: end_points
#
#  id         :integer          not null, primary key
#  address    :string
#  long       :float
#  lat        :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EndPoint < ApplicationRecord
  has_many :rides

  validates :address, presence: true
  validates :long, presence: true
  validates :lat, presence: true

  geocoded_by :address, latitude: :lat, longitude: :long
  after_validation :geocode, if: :address_changed?
end
