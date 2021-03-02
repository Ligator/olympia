class OrdersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create_checkout_session

  def cart
    set_quantities_hash
  end

  def add_to_cart
    @product = Product.find(params[:product_id])
    session["cart_#{current_or_guest_user.id}"] ||= {}
    session["cart_#{current_or_guest_user.id}"][@product.id] ||= 0
    session["cart_#{current_or_guest_user.id}"][@product.id] += 1
  end

  def remove_from_cart
    session["cart_#{current_or_guest_user.id}"].delete(params[:product_id])
    set_quantities_hash
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
        price_in_cents: product.price_in_cents,
        quantity: quantity,
        size: product.size
      })

      @currency = "mxn"
      line_items << {
        price_data: {
          currency: @currency,
          product_data: {
            name: product.name,
            description: product.description,
            images: []
          },
          unit_amount: product.price_in_cents,
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
    })

    respond_to do |format|
      format.json { render json: { id: session.id } }
      format.html { head(:ok) }
    end

  rescue Stripe::InvalidRequestError => error
    respond_to do |format|
      format.json { render json: { msg: error.message }}
      format.html { head(:ok) }
    end
  end

  def thank_you
    session.delete("cart_#{current_or_guest_user.id}")
    stripe_session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @customer = Stripe::Customer.retrieve(stripe_session.customer)
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

  def set_quantities_hash
    if session["cart_#{current_or_guest_user.id}"].present?
      @products = Product.where(id: session["cart_#{current_or_guest_user.id}"].keys).to_a
      @quantities_hash = session["cart_#{current_or_guest_user.id}"].dup.transform_keys do |product_id|
        @products.find { |product| product.id.to_s == product_id }
      end
    end
  end
end
