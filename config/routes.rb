Rails.application.routes.draw do
  resources :games
  resources :users

  post 'register', to: 'authentications#register'
  post 'login', to: 'authentications#login'
end
