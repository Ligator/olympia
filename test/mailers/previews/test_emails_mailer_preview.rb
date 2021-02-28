# Preview all emails at http://localhost:3000/rails/mailers/test_emails_mailer
class TestEmailsMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/test_emails_mailer/test
  def test
    TestEmailsMailer.test
  end

end
