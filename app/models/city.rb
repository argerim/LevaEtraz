class City < ActiveRecord::Base
  validates :name, :map_id, presence: true
  validates :name, uniqueness: { scope: :map_id }

  belongs_to :map

  has_many :destinations, foreign_key: :origin_id, dependent: :destroy, class_name: :Route

  scope :by_name, -> (name) { where(name: name).first_or_create }
end
