# == Schema Information
#
# Table name: start_points
#
#  id         :integer          not null, primary key
#  station    :string
#  long       :float
#  lat        :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StartPoint < ApplicationRecord
  has_many :rides

  validates :station, presence: true
  validates :long, presence: true
  validates :lat, presence: true

  geocoded_by :station, latitude: :lat, longitude: :long
  after_validation :geocode, if: :station_changed?
end




