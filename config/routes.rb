Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :maps, only: [:update, :create, :index, :destroy]
      resources :cities, only: [:update, :create, :index, :destroy]
      resources :routes, only: :create
      resources :shortest_path, only: :index
    end
  end
end
