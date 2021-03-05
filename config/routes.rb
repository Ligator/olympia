Rails.application.routes.draw do
  get 'profile/index', action: 'index', controller: 'profiles'
  get 'profile/show', action: 'show', controller: 'profiles'
  get 'profile/shipments', action: 'shipments', controller: 'profiles'
  get 'profile/orders', action: 'orders', controller: 'profiles'
  get 'profile/products', action: 'products', controller: 'profiles'
  get 'profile/cards', action: 'cards', controller: 'profiles'
  get 'orders/cart'
  get 'orders/thank_you'
  post 'orders/add_to_cart'
  post 'orders/remove_from_cart'
  get '/search', action: 'index', controller: 'searches'
  post '/search', action: 'index', controller: 'searches'
  post '/order_product_by_name', action: 'order_product_by_name', controller: 'searches'
  post 'orders/create_checkout_session'
  post 'languages/set_language'

  resources :products
  resources :stores do
    resources :products do
      resources :comments
    end
  end
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  devise_scope :user do
    get 'user/edit', to: 'users/registrations#edit'
  end
  get "statics/home"
  get "statics/test_email"
  get "statics/information"
  get "statics/suscription"


  root to: "statics#home"
end
