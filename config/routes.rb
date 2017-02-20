Rails.application.routes.draw do
  post 'games/search', to: 'games#index'
  resources :games

  post 'register', to: 'authentications#register'
  post 'login', to: 'authentications#login'
end
