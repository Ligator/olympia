class TestEmailsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.test_emails_mailer.test.subject
  #
  def test
    @greeting = "Hi, this is a test to send emails"

    mail to: "to@example.org"
  end

  def send_email(email)
    mail(to: email, subject: "¡Bienvenid@ a la cooperativa!", from: "support@colordemipueblo.com")
  end

  def order_confirmation(email, order_id)
    @order = Order.find(order_id)
    mail(to: email, subject: "Gracias por su compra", from: "support@colordemipueblo.com")
  end
end
