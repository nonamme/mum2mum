Rails.application.routes.draw do

  get 'moms/nearby'
  get 'moms/listAllMums', as: 'all'

  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/destroy'

  root "users#index", to: "users/index"

  get "/error", to: "users#error"
  get "/login", to: "users#login"

  # user home page after login
  get "/home", to: "users#home"

  resources :users, :path => ''

  post 'newsletter/create' => 'newsletter#create', as: 'create'

  get '*path' => redirect('users/error')
end
