Rails.application.routes.draw do
  root to: 'calendars#index'
  resources :calendars
  resources :schedules, only: [:create, :new]
end
