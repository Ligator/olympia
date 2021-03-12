Rails.application.routes.draw do
  resources :proposals
  resources :agremments
  resources :cards
  get 'profile/index', action: 'index', controller: 'profiles'
  get 'profile/show', action: 'show', controller: 'profiles'
  get 'profile/shipments', action: 'shipments', controller: 'profiles'
  get 'profile/sales', action: 'sales', controller: 'profiles'
  get 'profile/products', action: 'products', controller: 'profiles'
  get 'profile/cards', action: 'cards', controller: 'profiles'
  get 'profile/users', action: 'users', controller: 'profiles'
  get 'orders/cart'
  get 'orders/thank_you'
  post 'orders/add_to_cart'
  post 'orders/remove_from_cart'
  post '/products/search', action: 'index', controller: 'products'
  post '/order_product_by_name', action: 'order_product_by_name', controller: 'searches'
  post 'orders/create_checkout_session'
  get 'orders/update_quantity_in_cart'
  post 'languages/set_language'
  get "orders/show"
  resources :products
  resources :stores do
    resources :products do
      resources :comments
    end
  end
  devise_for :users, :controllers => { registrations: 'users/registrations' }
  devise_scope :user do
    get 'user/edit', to: 'users/registrations#edit'
    put 'user/address', to: 'users/registrations#update_current_or_guest_user'
  end
  get "statics/home"
  get "statics/test_email"
  get "statics/information"
  get "statics/suscription"


  root to: "statics#home"
end
