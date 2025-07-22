Rails.application.routes.draw do
  devise_for :users,
    controllers: {
      sessions: 'users/sessions'
    },
    defaults: { format: :json }

    resources :listings
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
