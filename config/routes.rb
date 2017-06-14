Rails.application.routes.draw do

  root "users#index", to: "users/index"

  resources :users
  # get "users/new" => "users#new"
  # get "users/create" => "users#create"

  # post "users/new" => "users#new"
  post 'newsletter/create' => 'newsletter#create', as: 'create'
end
