Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tours do
    resources :bookings, only: %i[create new]
  end
  resources :bookings, only: %i[index show edit destroy update] do
    resources :companions, only: %i[create]
    resources :reviews, only: %i[create]

  end
  # get '/users/:id/bookings', to: 'bookings#mybookings', as: 'mybookings'

  resources :agencies do
    resources :tours
  end
end
