require 'rails_helper'

describe FuelPrice do

  let(:fuel_price) { FuelPrice.new(25, "2,5", 10) }

  it { expect(fuel_price.value).to eql(2.5) }
  
  it { expect(fuel_price.total).to eql(6.25) }
  
end