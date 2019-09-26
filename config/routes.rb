Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "sessions#index"  

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  get "/signup" => "users#new"
  post "/signup" => "users#create"

  get "/auth/:provider/callback" => "sessions#create"

  get "/bylocation" => "cryptids#bylocation"

  get "/mostobs" => "users#mostobs"

  resources :cryptids do
    resources :observations, only: [:index, :new, :create]
  end

  resources :users, only: [:show] do
    resources :observations
  end

  resources :observations, only: [:show] do
    resources :cryptids, only: [:new]
  end

  resources :observations do
    resources :comments
  end  

  resources :users, only: [:show, :new, :create]
  resources :observations
  resources :cryptids  
end
