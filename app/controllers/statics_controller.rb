class StaticsController < ApplicationController
  def home
  end

  def test_email
    TestEmailsMailer.test.deliver_now
    redirect_to :statics_home
  end
end
