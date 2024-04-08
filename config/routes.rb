Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :library, only: %i[index show update] do
    collection do
      get 'search'
      post 'search'
      post 'results'
    end

    resources :films, only: %i[new create update]
  end

  resources :lists do
    resources :film_lists do
      collection do
        post 'results'
      end
    end
  end
end
