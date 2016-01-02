class City < ActiveRecord::Base
  validates :name, :map_id, presence: true
  validates :name, uniqueness: { scope: :map_id }

  belongs_to :map

  has_many :destinations, foreign_key: :origin_id, dependent: :destroy, class_name: :Route

  scope :by_name, -> (name) { where(name: name).first_or_create }


  def self.all_destinations
    [].tap do |destinations|
      all.each do |city|
        city.destinations.each do |route|
          destinations << [route.origin.name.upcase, route.destination.name.upcase, route.distance]
        end
      end
    end
    
  end
end
