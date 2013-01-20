TheSecret::Application.routes.draw do
  root :to => 'home#index'
  
  get "secret", to: "home#secret", as: :secret
  get 'auth/:provider/callback', to: 'authentications#omniauth'
  get 'auth/failure', to: redirect('/')
  resource :session
  resource :profile
  resources :users
  resources :authentications
end
