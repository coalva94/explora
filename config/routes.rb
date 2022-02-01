Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tours do
    resources :bookings, only: %i[create new]
  end
  resources :bookings, only: %i[index show edit destroy update]
  get '/users/:id/bookings', to: 'bookings#mybookings', as: 'mybookings'
end

# get '/patients/:id', to: 'patients#show'

# resources :users do
#     resources :bookings
#     resources :cars, get: ':user_id/cars', :as => 'carros' ,to: 'cars#mycars'

# end

# /	GET	pages	home
# /tours	GET	offers	index
# /tours/:id	GET	tours	show
# /tours/:id/questions/:id	POST 	questions	create
# /tours/:id/bookings/:id	POST 	bookings	create
# users/id/bookings	GET	users	index
# /tours/:id/bookings/:id	POST 	booking	create
# tours/:id/bookings/:id/edit	PATCH	booking	update
# tours/:id/bookings/:id/	DELETE	booking	desttoy
# tours/new	GET	tour	new
# tours	POST 	tours	create
# tours/:id/edit	GET	tours	edit
# tours/:id	PATCH	tour	update
# tours/:id	DELETE	tour 	destroy
# tour/id/question	POST 	question	create
# bookings	GET	bookings	index
