Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "sessions#index"  

  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  get "/signup" => "users#new"
  post "/signup" => "users#create"

  resources :cryptids do
    resources :observations, only: [:index, :new, :create]
  end

  resources :users, only: [:show] do
    resources :observations, only: [:index]
  end

  resources :observations, only: [:show] do
    resources :cryptids, only: [:new]
  end

  resources :users, only: [:show, :new, :create]
  resources :observations
  resources :cryptids
end
