Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks"
  }

  resources :users

  resources :sections do
    resources :checkpoints
  end

  root "welcome#index"
end
