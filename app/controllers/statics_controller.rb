class StaticsController < ApplicationController
  def home
    TestEmailsMailer.test.deliver_now
  end
end
