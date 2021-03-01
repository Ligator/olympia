module ApplicationHelper
  def cart_products_count
    return 0 unless cart?
    session["cart_#{current_or_guest_user.id}"].count
  end

  def cart?
    session["cart_#{current_or_guest_user.id}"].present?
  end
end
