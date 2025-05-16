Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :ingredients, only: [:index, :create, :show, :destroy]
      resources :recipes, only: [:index, :create, :show, :destroy]
    end
  end
  root 'homepage#index'
  get '*path', to: 'homepage#index', constraints: ->(req) do
    !req.xhr? && req.format.html?
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
