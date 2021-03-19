# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  guest                  :boolean          default(FALSE)
#  locale                 :string           default("es")
#  stripe_customer_id     :string
#  first_name             :string
#  last_name              :string
#  phone                  :string
#  new_partner            :boolean
#  role                   :string           default("customer")
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :store, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :card, dependent: :destroy
  has_one_attached :avatar, dependent: :destroy
  has_many_attached :demo_images, dependent: :destroy
  has_one :address, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  def full_name
    [first_name, last_name].compact.join(" ").squeeze
  end

  def customer?
    role == "customer"
  end

  def applicant?
    role == "applicant"
  end

  def seller?
    role == "seller"
  end

  def admin?
    role == "admin"
  end
end
