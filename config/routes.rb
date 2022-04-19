Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'flights#index'

  get '/flights', to: 'flights#index'
  get '/bookings/new', to: 'bookings#new'
  resources :bookings
end