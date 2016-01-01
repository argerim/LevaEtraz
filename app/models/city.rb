class City < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: { scope: :map_id }

  belongs_to :map
end
