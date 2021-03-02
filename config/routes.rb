Rails.application.routes.draw do
  get 'orders/cart'
  get 'orders/thank_you'
  post 'orders/add_to_cart'
  post 'orders/remove_from_cart'
  get '/search', action: 'index', controller: 'searches'
  post '/search', action: 'index', controller: 'searches'
  post 'orders/create_checkout_session'
  post 'languages/set_language'
  resources :products
  resources :stores do
    resources :products do
      resources :comments
    end
  end
  devise_for :users
  get "statics/home"
  get "statics/test_email"

  root to: "statics#home"
end
