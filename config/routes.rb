Rails.application.routes.draw do
  resources :reviews
  get 'sessions/new'
  root 'welcome#home'
  get 'welcome/home' => 'welcome#home'
  

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'



  get 'renter/home' => 'renter#home'
  resources :bookings
  resources :appliances
  resources :owners
  resources :renters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
