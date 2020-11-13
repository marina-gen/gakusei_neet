Rails.application.routes.draw do
  root to: 'schedules#index'
  resources :schedules
  root to: 'main_screens#index'
  resources :main_screens
end
