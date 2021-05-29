Rails.application.routes.draw do
  devise_for :users, controllers: { confirmations: 'confirmations' }

  resources :users, only: [:index, :show, :destroy]

  root 'static_pages#home'
  get "privacy_policy", to: "static_pages#privacy_policy"
end
