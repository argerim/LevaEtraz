class ShortestPath

  def initialize(params)
    @params = params    
  end

  def fuel_prices
    @fuel_prices = @params[:fuel_prices]
  end

  def car_autonomy
    @car_autonomy = @params[:autonomy]
  end

  def destination
    @destination = @params[:destination].upcase
  end

  def origin
    @origin = @params[:origin].upcase
  end

  def total
    FuelPrice.new(graph.distance, fuel_prices, car_autonomy).total
  end

  def all_destinations
    @all_destinations ||= City.all_destinations
  end

  def graph
    @graph = Graph.new(origin, destination, all_destinations)
  end

  def build
    {
      nodes: graph.shortest_path,
      distance: graph.distance,
      cost: total
    }
  end
end