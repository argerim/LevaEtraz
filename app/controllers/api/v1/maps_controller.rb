class Api::V1::MapsController < ApiController

  before_action :get_map, only: [:update, :destroy]  
  
  def index
    maps = Map.all
    render json: maps, status: 200
  end

  def create
    map = Map.new(map_params[:map])
    if map.save
      render json: map, status: 201
    else
      render json: { errors: map.errors.full_messages }, status: 422
    end
  end

  def update
    if @map.update_attributes(map_params[:map])
      render json: @map, status: 201
    else
      render json: { errors: @map.errors.full_messages }, status: 422
    end
  end

  def destroy
    head 204 if @map.destroy
  end

  private

    def get_map
      @map = Map.find(params[:id])
    end

    def map_params    
      params.permit(map: [:name])
    end
end