class OrdersController < ApplicationController
  def cart
  end

  def create
    @order = Order.create
    redirect_on_invalid_cart && return unless cart?
    sessions["cart_#{current_user&.id}"].each do |product_details|
      product = Product.find(product_details[:id])
      @order.order_items.create({
        product: product,
        name: product.name,
        description: product.description,
        price_in_cents: product.price_in_cents,
        quantity: product.quantity,
        size: product.size,
        user: current_user
      })
    end

    redirect_to orders_checkout_path(order_id: @order.id)
  end

  def checkout
    @order = Order.find(params[:id])
    redirect_on_invalid_order && return unless @order.pending?
  end

  def purchase
  end

  def thank_you
    sessions.delete("cart_#{current_user&.id}")
  end

  private

  def redirect_on_invalid_cart
    redirect_to orders_cart_path
  end

  def redirect_on_invalid_order
    if @order.paid?
      flash[:error] = I18n.t(:order_already_paid)
    else
      flash[:error] = I18n.t(:invalid_order)
    end
    redirect_to orders_cart_path
  end
end
