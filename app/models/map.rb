class Map < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_many :cities, dependent: :destroy

  scope :by_name, -> (name) { where(name: name).first_or_create }
end
