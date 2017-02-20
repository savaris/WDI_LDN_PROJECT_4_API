Rails.application.routes.draw do
  resources :games
  post 'register', to: 'authentications#register'
  post 'login', to: 'authentications#login'
end
