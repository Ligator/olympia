class Product < ApplicationRecord
  has_many_attached :images, dependent: :destroy
  belongs_to :store
  has_many :comments, dependent: :destroy

  before_save :set_delivery_cost

  validates_presence_of :name, :description, :price_in_cents, :quantity
  # validates :weight, numericality: { greater_than: 0, only_integer: true }
  # validates :height, numericality: { greater_than: 0, only_integer: true }
  # validates :width,  numericality: { greater_than: 0, only_integer: true }
  # validates :length, numericality: { greater_than: 0, only_integer: true }

  scope :with_inventory, -> { where("quantity > ?", 0) }

  def full_price(currency)
    raise "Currency is missing" if currency.blank?
    case currency
    when "mxn"
      full_price_mxn.round(2)
    when "usd"
      full_price_usd.round(2)
    else
      raise "Unknown Currency"
    end
  end

  def full_price_mxn
    (price_in_cents / 100.0).to_d + delivery_cost.to_d
  end

  def full_price_usd
    full_price_mxn / ENV["ONE_USD_TO_MXN"].to_d
  end

  def full_price_in_cents(currency)
    raise "Currency is missing" if currency.blank?
    case currency
    when "mxn"
      full_price_in_cents_mxn
    when "usd"
      full_price_in_cents_usd
    else
      raise "Unknown Currency"
    end
  end

  def full_price_in_cents_mxn
    (price_in_cents).to_i + (delivery_cost.to_i * 100)
  end

  def full_price_in_cents_usd
    (full_price_in_cents_mxn / ENV["ONE_USD_TO_MXN"].to_i).to_i
  end

  def set_delivery_cost
    self.delivery_cost ||= ENV["PACKAGE_COST"].to_i

    return if weight_was == weight &&
              height_was == height &&
              width_was == width &&
              length_was == length

    if [weight, height, width, length].map(&:to_i).any?(&:zero?)
      self.delivery_cost = ENV["PACKAGE_COST"].to_i
      return
    end
    if store.user.address.postal_code.blank?
      self.delivery_cost = ENV["PACKAGE_COST"].to_i
      return
    end

    response = SkyDropX.new.quotations({
      zip_from: store.user.address.postal_code,
      zip_to: "64000",
      parcel: {
        weight: weight.to_i,
        height: height.to_i,
        width: width.to_i,
        length: length.to_i
      }
    })

    if response.is_a?(Array)
      self.delivery_cost = response.map{ |packing_service| packing_service["total_pricing"].to_d }.min
    else
      self.delivery_cost = ENV["PACKAGE_COST"].to_i
    end
  rescue
    self.delivery_cost = ENV["PACKAGE_COST"].to_i
  end
end
