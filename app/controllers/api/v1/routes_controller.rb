class Api::V1::RoutesController < ApiController
  
  def create
    route = Route.new(BuildRoute.new(origin_params).to_hash)
    if route.save
      render json: route, status: 201
    else
      render json: { errors: route.errors.full_messages }, status: 422
    end
  end

  private

    def origin_params    
      params.permit(route: [:origin, :destination, :map, :distance])
    end
  
end