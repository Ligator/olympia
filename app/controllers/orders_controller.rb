class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create_checkout_session

  def show
    @order = Order.find(params[:order_id])
  end

  def cart
    set_quantities_hash
    @total = cart_order_total
  end

  def add_to_cart
    @product = Product.find(params[:product_id])
    session["cart_#{current_or_guest_user.id}"] ||= {}
    session["cart_#{current_or_guest_user.id}"][@product.id.to_s] ||= 0
    session["cart_#{current_or_guest_user.id}"][@product.id.to_s] = session["cart_#{current_or_guest_user.id}"][@product.id.to_s] + 1
  end

  def remove_from_cart
    @total = cart_order_total
    session["cart_#{current_or_guest_user.id}"].delete(params[:product_id])
    set_quantities_hash
  end

  def update_quantity_in_cart
    @product = Product.find(params[:product_id])
    session["cart_#{current_or_guest_user.id}"][@product.id.to_s] = params[:quantity].to_i
    render html: "<h3>Total #{ActionController::Base.helpers.number_to_currency(cart_order_total, locale: @currency)}</h3>".html_safe,
           layout: false
  end

  def create_checkout_session
    redirect_on_invalid_cart && return unless cart?
    line_items = []

    @order = Order.create(user: current_or_guest_user)
    Product.where(id: session["cart_#{current_or_guest_user.id}"].keys).each do |product|
      quantity = session["cart_#{current_or_guest_user.id}"][product.id.to_s]
      @order.order_items.create({
        product: product,
        name: product.name,
        description: product.description,
        price_in_cents: product.full_price_in_cents(@currency),
        quantity: quantity,
        size: product.size
      })

      line_items << {
        price_data: {
          currency: @currency,
          product_data: {
            name: product.name,
            description: product.description,
            images: []
          },
          unit_amount: product.full_price_in_cents(@currency),
        },
        quantity: quantity
      }
    end

    session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      line_items: line_items,
      mode: 'payment',
      customer_email: current_user&.email,
      locale: current_or_guest_user.locale,
      success_url: orders_thank_you_url(session_id: "") + "{CHECKOUT_SESSION_ID}",
      cancel_url: orders_cart_url,
      metadata: {
        order_id: @order.id
      }
    })

    respond_to do |format|
      format.json { render json: { id: session.id } }
      format.html { head(:ok) }
    end
  end

  def thank_you
    session.delete("cart_#{current_or_guest_user.id}")

    redirect_on_invalid_order && return if params[:session_id].blank?
    stripe_session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @customer = Stripe::Customer.retrieve(stripe_session.customer)

    order = Order.find_by_id(stripe_session.metadata[:order_id])
    redirect_on_invalid_order && return if order.blank?
    order.update(state: stripe_session.payment_status, stripe_session: stripe_session.id, payment_method: stripe_session.payment_method_types.last)
    current_user&.update(stripe_customer_id: stripe_session.customer)
  end

  private

  def redirect_on_invalid_cart
    redirect_to orders_cart_path
  end

  def redirect_on_invalid_order
    flash[:error] = I18n.t(:invalid_order)
    redirect_to orders_cart_path
  end

  def cart?
    session["cart_#{current_or_guest_user.id}"].present?
  end

  def set_quantities_hash
    if session["cart_#{current_or_guest_user.id}"].present?
      @products = Product.where(id: session["cart_#{current_or_guest_user.id}"].keys).to_a
      @quantities_hash = session["cart_#{current_or_guest_user.id}"].dup.transform_keys do |product_id|
        @products.find { |product| product.id.to_s == product_id }
      end
    end
  end

  def cart_order_total
    return 0 if session["cart_#{current_or_guest_user.id}"].blank?
    total = 0
    session["cart_#{current_or_guest_user.id}"].each do |product_id, quantity|
      total += (Product.find(product_id).full_price(@currency) * quantity.to_i).to_d.round(2)
    end
    total.to_d.round(2)
  end
end
