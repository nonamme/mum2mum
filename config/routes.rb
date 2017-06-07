Rails.application.routes.draw do

  root "users#index", to: "users/index"

  post 'newsletter/create' => 'newsletter#create', as: 'create'
end
