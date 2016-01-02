class Api::V1::ShortestPathController < ApiController
  
  def index
    shotest_path = ShortestPath.new(shortest_path_params[:shortest_path]).build
    render json: shotest_path, status: 200
  end

  private

    def shortest_path_params    
      params.permit(shortest_path: [:origin, :destination, :autonomy, :fuel_prices])
    end
end