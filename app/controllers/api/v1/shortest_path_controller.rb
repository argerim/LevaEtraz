class Api::V1::ShortestPathController < ApiController
  
  def index
    if check_origin! && check_destination!
      shotest_path = ShortestPath.new(shortest_path_params[:shortest_path]).build
      render json: shotest_path, status: 200
    else
      render json: "invalid origin/destination", status: 200
    end
  end

  private

    def shortest_path_params    
      params.permit(shortest_path: [:origin, :destination, :autonomy, :fuel_prices])
    end

    def check_origin!
      City.where(name: shortest_path_params[:shortest_path][:origin]).present?
    end

    def check_destination!
      City.where(name: shortest_path_params[:shortest_path][:destination]).present?
    end
end