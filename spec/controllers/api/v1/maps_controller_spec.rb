require 'rails_helper'

describe Api::V1::MapsController do

  context "GET #index" do
    before(:each) do
      create_list(:map, 5)
      get :index, format: :json
    end

    it "returns the information about a reporter on a hash" do
      maps_response = json_response
      expect(maps_response[:maps].length).to eq(5)
    end

    it { expect(response).to be_success }
  end

  context "POST #create" do

    context "when is successfully created" do

      before(:each) do
        @map_attributes = attributes_for(:map)
        post :create, { map: @map_attributes }
      end

      it "renders the json representation for the map record just created" do
        map_response = json_response
        expect(map_response[:map][:name]).to eql(@map_attributes[:name])
      end

      it { expect(response.status).to eql(201) }
    end

    context "when is not created" do

      before(:each) do
        @invalid_map_attributes = attributes_for(:map, name: "")
        post :create, { map: @invalid_map_attributes }
      end

      it "renders an errors json" do
        map_response = json_response
        expect(map_response).to have_key(:errors)        
      end
      
      it "renders the json errors on whye the user could not be created" do
        map_response = json_response
        expect(map_response[:errors]).to include("Name can't be blank")
      end

      it { expect(response.status).to eql(422) }
    end
  end


  context "PUT #update" do

    context "when is successfully updated" do

      before :each do
        @map = create(:map)
        put :update, {id: @map.to_param, map: attributes_for(:map, name: "Piauí") }
      end

      it "renders the json representation for the map record just updated" do
        map_response = json_response
        expect(map_response[:map][:name]).to eql("Piauí")
      end

      it { expect(response.status).to eql(201) }
    end

    context "when is not updated" do

      before(:each) do
        @map = create(:map)
        put :update, {id: @map.to_param, map: attributes_for(:map, name: "") }
      end
      
      it "renders an errors json" do
        map_response = json_response
        expect(map_response).to have_key(:errors)  
      end

      it "renders the json errors on whye the user could not be created" do
        map_response = json_response
        expect(map_response[:errors]).to include("Name can't be blank")
      end

      it { expect(response.status).to eql(422) }
    end
  end

  context "DELETE #destroy" do

    before(:each) do
      map = create(:map)
      delete :destroy, id: map.id
    end

    it { expect(response.status).to eql(204) }
  end
end