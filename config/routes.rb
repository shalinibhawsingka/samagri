Rails.application.routes.draw do
  resources :notifications
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  root "home#index"
  get "home", to: "home#index"
  get "/show", to: "home#show"
  resources :users, except: [:show]
  resources :categories, except: [:show]
  resources :brands, except: [:show]
  resources :employees, except: [:show]
  resources :items do
    resources :posts
  end
  resources :storage, only: [:index]
  resources :issues, except: [:show]
  mount ActionCable.server => '/cable'
  get "notifications", to: "notifications#index"
end
