Rails.application.routes.draw do
  root 'static_pages#home'
  get "privacy_policy", to: "static_pages#privacy_policy"
end
