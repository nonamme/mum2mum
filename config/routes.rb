Rails.application.routes.draw do

  root "users#index", to: "users/index"

  get 'moms/nearby'
  get 'moms/listAllMums', as: 'all'
  get 'moms/showProfile/:id', to: 'moms#showProfile', as: 'show_profile'

  get 'places/list'

  post 'comments/add', as: 'comment'

  resources :users, except: [:index, :show, :edit, :delete, :update, :create, :new] do
    get :comments
  end

  get 'sessions/new'
  post 'sessions/create'
  get 'sessions/destroy'

  get "/error", to: "users#error"
  get "/login", to: "users#login"

  # user home page after login
  get "/home", to: "users#home"

  resources :users, :path => '', except: [:update]
  patch 'users/:id', to: 'users#update', as: 'update'

  post 'newsletter/create' => 'newsletter#create', as: 'create'

  get '*path' => redirect('users/error')
end
