Rails.application.routes.draw do
  resources :schedules, only: [:create, :new]
end
