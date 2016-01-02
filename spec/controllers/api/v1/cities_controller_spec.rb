require 'rails_helper'

describe Api::V1::CitiesController do

  let(:map) { create(:map) }

  context "GET #index" do
    before(:each) do
      create_list(:city, 5)
      get :index, format: :json
    end

    it "returns the information about a reporter on a hash" do
      cities_response = json_response
      expect(cities_response[:cities].length).to eq(5)
    end

    it { expect(response).to be_success }
  end

  context "POST #create" do

    context "when is successfully created" do

      before(:each) do
        @city_attributes = attributes_for(:city)
        post :create, { city: @city_attributes, map_name: map.name }
      end

      it "renders the json representation for the city record just created" do
        city_response = json_response
        expect(city_response[:city][:name]).to eql(@city_attributes[:name])
      end

      it { expect(response.status).to eql(201) }
    end

    context "when is not created" do

      before(:each) do
        @invalid_city_attributes = attributes_for(:city, name: "")
        post :create, { city: @invalid_city_attributes, map_name: map.name }
      end

      it "renders an errors json" do
        city_response = json_response
        expect(city_response).to have_key(:errors)        
      end
      
      it "renders the json errors on whye the city could not be created" do
        city_response = json_response
        expect(city_response[:errors]).to include("Name can't be blank")
      end

      it { expect(response.status).to eql(422) }
    end
  end


  context "PUT #update" do

    context "when is successfully updated" do

      before :each do
        @city = create(:city)
        put :update, {id: @city.to_param, city: attributes_for(:city, name: "A"), map_name: map.name }
      end

      it "renders the json representation for the city record just updated" do
        city_response = json_response
        expect(city_response[:city][:name]).to eql("A")
      end

      it { expect(response.status).to eql(201) }
    end

    context "when is not updated" do

      before(:each) do
        @city = create(:city)
        put :update, {id: @city.to_param, city: attributes_for(:city, name: ""), map_name: map.name }
      end
      
      it "renders an errors json" do
        city_response = json_response
        expect(city_response).to have_key(:errors)  
      end

      it "renders the json errors on whye the user could not be created" do
        city_response = json_response
        expect(city_response[:errors]).to include("Name can't be blank")
      end

      it { expect(response.status).to eql(422) }
    end
  end

  context "DELETE #destroy" do

    before(:each) do
      city = create(:city)
      delete :destroy, id: city.id
    end

    it { expect(response.status).to eql(204) }
  end
end