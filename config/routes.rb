Rails.application.routes.draw do
  get 'main_diaries/index' => "main_diaries#index"
  get 'main_diaries/new' => "main_diaries#new"
  post 'main_diaries/create' => "main_diaries#create"

end
