Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }

  namespace :account do
    resources :missions
  end

  namespace :admin do
    resources :users
    resources :sections
    resources :missions do
      resources :checkpoints
    end
    resources :checkpoints do
      resources :references
    end
  end

  resources :sections
  resources :missions
  resources :checkpoints do
    member do
      post :check
    end
  end

  root "welcome#index"
end
