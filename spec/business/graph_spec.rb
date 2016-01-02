require 'rails_helper'

describe Graph do

  let(:graph) { Graph.new("A", "D", City.all_destinations) }

  it { expect(graph.shortest_path).to eql(["A", "B", "D"]) }
  
  it { expect(graph.distance).to eql(25) }
  
end