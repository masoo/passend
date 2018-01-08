# Preview all emails at http://localhost:3000/rails/mailers/authentication_mailer
class AuthenticationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/authentication_mailer/magic_login_email
  def magic_login_email
    AuthenticationMailer.magic_login_email
  end

end
