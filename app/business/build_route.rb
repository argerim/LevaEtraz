class BuildRoute

  attr_accessor :origin, :destionation, :distance
  
  def initialize(params)
    @params = params
  end

  def route
    @params[:route]
  end

  def origin
    @origin = map.cities.by_name(route[:origin])
  end

  def destination
    @destination = map.cities.by_name(route[:destination])
  end

  def map
    @map = Map.by_name(route[:map])
  end

  def distance
    route[:distance]
  end

  def to_hash
    { origin: origin, destination: destination, distance: distance }
  end

end