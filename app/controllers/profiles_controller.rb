class ProfilesController < ApplicationController
  def index
    render layout: 'profile'
  end

  def show
    if current_user.blank? || current_user.store.blank?
      redirect_to new_user_session_path
      return
    end
    render layout: 'profile'
  end

  def shipments
    store = current_user.store
    product_ids = store.products.ids
    @order_items = OrderItem.joins(:order).where(orders: { state: "paid" }, product_id: product_ids)
    render layout: 'profile'
  end

  def sales
    render layout: 'profile'
  end

  def products
    render layout: 'profile'
  end

  def cards
    render layout: 'profile'
  end

end
