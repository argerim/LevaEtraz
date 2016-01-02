class Api::V1::CitiesController < ApiController
  
  before_action :get_map,  only: [:create, :update]
  before_action :get_city, only: [:update, :destroy]
  
  def index
    cities = City.all
    render json: cities, status: 200
  end

  def create
    city = @map.cities.build(city_params[:city])
    if city.save
      render json: city, status: 201
    else
      render json: { errors: city.errors.full_messages }, status: 422
    end
  end

  def update
    @city.map_id = @map.id if @map.present?
    if @city.update_attributes(city_params[:city])
      render json: @city, status: 201
    else
      render json: { errors: @city.errors.full_messages }, status: 422
    end
  end

  def destroy
    head 204 if @city.destroy
  end

  private

    def get_map
      @map = Map.where(name: params[:map_name]).first_or_create
    end

    def get_city
      @city = City.find(params[:id])
    end

    def city_params    
      params.permit(city: [:name])
    end
end