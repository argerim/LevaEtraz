require 'rails_helper'

describe Api::V1::RoutesController do

  let(:route_params) { { route: { origin: "F", destination: "G", map: "SP", distance: "10" } } }

  context "POST #create" do

    context "when is successfully created" do

      before(:each) do
        @route_attributes = route_params
        post :create, @route_attributes
      end

      it "renders the json representation for the route record just created" do
        route_response = json_response
        expect(route_response).to be_kind_of(Hash)
      end

      it { expect(response.status).to eql(201) }
    end

    context "when is not created" do

      before(:each) do        
        post :create, { route: {} }
      end

      it "renders an errors json" do
        route_response = json_response
        expect(route_response).to have_key(:error)        
      end
      
      it "renders the json errors on whye the route could not be created" do
        route_response = json_response
        expect(route_response[:error]).to include("You cannot call create unless the parent is saved")
      end

      it { expect(response.status).to eql(422) }
    end
  end

end