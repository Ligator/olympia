Rails.application.routes.draw do
  resources :products
  resources :stores
  devise_for :users
  get "statics/home"
  get "statics/test_email"

  root to: "statics#home"
end
