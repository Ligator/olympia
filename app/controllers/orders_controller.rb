class OrdersController < ApplicationController
  def cart
    @products = Product.where(id: session["cart_#{current_or_guest_user.id}"].keys).to_a
    @quantities_hash = session["cart_#{current_or_guest_user.id}"].dup.transform_keys do |product_id|
      @products.find { |product| product.id.to_s == product_id }
    end
  end

  def add_to_cart
    @product = Product.find(params[:product_id])
    session["cart_#{current_or_guest_user.id}"] ||= {}
    session["cart_#{current_or_guest_user.id}"][@product.id] ||= 0
    session["cart_#{current_or_guest_user.id}"][@product.id] += 1
  end

  def remove_from_cart
    session["cart_#{current_or_guest_user.id}"].delete(params[:product_id])
  end

  def create
    redirect_on_invalid_cart && return unless cart?

    @order = Order.create
    Product.where(id: session["cart_#{current_or_guest_user.id}"].keys).each do |product|
      @order.order_items.create({
        product: product,
        name: product.name,
        description: product.description,
        price_in_cents: product.price_in_cents,
        quantity: session["cart_#{current_or_guest_user.id}"][product.id],
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
    session.delete("cart_#{current_user&.id}")
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

  def cart?
    session["cart_#{current_or_guest_user.id}"].present?
  end
end
