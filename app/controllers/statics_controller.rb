class StaticsController < ApplicationController
  def home
      @products = Product.with_inventory.all
  end

  def test_email
    TestEmailsMailer.test.deliver_now
    redirect_to :statics_home
  end

  def information
  end

  def suscription
    TestEmailsMailer.send_email.deliver_now
  end
end
