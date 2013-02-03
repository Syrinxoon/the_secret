TheSecret::Application.routes.draw do
  root :to => 'home#index'
  
  get "secret", to: "home#secret", as: :secret
  match 'auth/:provider/callback', to: 'authentications#omniauth', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  resource :session
  resource :profile
  resources :users
  resources :authentications
end
