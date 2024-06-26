Rails.application.routes.draw do

  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [] do
    resources :bookings, only: [:index]
  end
  
  get 'my_cars', to: 'cars#my_cars'

  resources :cars do
    resources :bookings, only: %i[index new create]
  end

  resources :bookings, only: [:destroy]
end
