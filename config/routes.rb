Rails.application.routes.draw do
  get 'localhost:3000/main_screen' => 'schedule#index'
  resources :schedules
  root to: 'main_screens#index'
  resources :main_screens
end
