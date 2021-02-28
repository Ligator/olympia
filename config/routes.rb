Rails.application.routes.draw do
  get 'orders/cart'
  get 'orders/checkout'
  get 'orders/thank_you'
  resources :products
  resources :stores
  devise_for :users
  get "statics/home"
  get "statics/test_email"
  root to: "statics#home"
end
