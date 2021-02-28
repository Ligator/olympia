Rails.application.routes.draw do
  resources :products
  resources :stores
  devise_for :users
  get 'statics/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
