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
  # for start point we don't need to activate geocode if station changed
  # after_validation :geocode, if: :station_changed?
  before_validation :geocode, on: :create, if: :geo_blank

  def geo_blank
    lat.blank? && long.blank?
  end

  include PgSearch
  pg_search_scope :search_by_title_and_syllabus, against: [ :title, :syllabus ]

end




