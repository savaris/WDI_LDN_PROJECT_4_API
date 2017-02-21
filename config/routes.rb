Rails.application.routes.draw do
  resources :libraries
  resources :games
  resources :users
  post 'library', to: 'libraries#add'
  post 'register', to: 'authentications#register'
  post 'login', to: 'authentications#login'
end
