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
  validates :phone, presence: true
  validates :email, presence: true

  def full_name
    [first_name, last_name].compact.join(" ").squeeze
  end

end
