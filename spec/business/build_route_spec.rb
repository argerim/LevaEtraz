require 'rails_helper'

describe BuildRoute do

  let(:origin_params) { { route: { origin: "A", destination: "B", map: "SP", distance: 10 } } }
  let(:build_route) { BuildRoute.new(origin_params) }

  it { expect(build_route.route).to eql(origin_params[:route]) }

  it { expect(build_route.origin).to be_kind_of(City) }

  it { expect(build_route.destination).to be_kind_of(City) }

  it { expect(build_route.map).to be_kind_of(Map) }

  it { expect(build_route.distance).to eql(10) }
  
  it { expect(build_route.to_hash).to be_kind_of(Hash) }
  
end