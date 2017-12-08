Rails.application.routes.draw do
  mount Attachinary::Engine => "/attachinary"
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :rides, only: [ :index, :show]

  resources :rides do
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:show, :create] do
    resources :payments, only: [:new, :create]
  end
end

