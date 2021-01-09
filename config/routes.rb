Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/lodout', to: 'sessions#destroy'
  namespace :admin do
    resources :users
  end
  get 'localhost:3000/main_screen' => 'schedule#index'
  resources :schedules
  root to: 'main_screens#index'
  resources :main_screens
end
