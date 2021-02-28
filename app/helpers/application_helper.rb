module ApplicationHelper
  def cart_products
    return [] unless cart?
    ids = sessions["cart_#{current_user&.id}"].map { |product_details| product_details[:id] }
    Product.where(id: ids)
  end

  def cart?
    sessions["cart_#{current_user&.id}"].present?
  end
end
