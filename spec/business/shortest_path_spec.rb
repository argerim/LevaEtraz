require 'rails_helper'

describe ShortestPath do

  let(:shortest_path_params) { { shortest_path: { origin:"A", destination: "D", 
                                                  autonomy: 10, fuel_prices: "2,5" 
                                                } 
                                } 
                            }
  let(:shortest_path) { ShortestPath.new(shortest_path_params[:shortest_path]) }

  it { expect(shortest_path.fuel_prices).to eql("2,5") }

  it { expect(shortest_path.car_autonomy).to eql(10) }

  it { expect(shortest_path.destination).to eql("D") }

  it { expect(shortest_path.total).to eql(6.25) }

  it { expect(shortest_path.all_destinations).to be_kind_of(Array) }

  it { expect(shortest_path.graph).to be_kind_of(Graph) }
  
  it { expect(shortest_path.build).to eql({nodes: ["A", "B", "D"], distance: 25, cost: 6.25 }) }
  
end