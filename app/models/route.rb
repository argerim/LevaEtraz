class Route < ActiveRecord::Base
  validates :origin_id, :destination_id, :distance, presence: true
  validates :destination_id, uniqueness: { scope: :origin_id }
  validates :origin_id, uniqueness: { scope: :destination_id }
  validates_with DistinctRouteValidator

  validates :distance, numericality: { only_integer: true }

  belongs_to :origin, foreign_key: :origin_id, class_name: :City
  belongs_to :destination, foreign_key: :destination_id, class_name: :City
end