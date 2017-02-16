Rails.application.routes.draw do
  post 'register', to: 'authentications#register'
  post 'login', to: 'authentications#login'
end
