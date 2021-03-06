class StaticsController < ApplicationController
  def home
      @products = Product.with_inventory.all.with_attached_images
  end

  def test_email
    TestEmailsMailer.test.deliver_now
    redirect_to :statics_home
  end

  def information
  end

  def suscription
    TestEmailsMailer.send_email(current_user.email).deliver_now
  end
end
