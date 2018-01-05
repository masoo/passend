class AuthenticationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.authentication_mailer.magic_login_email.subject
  #
  def magic_login_email(authentication)
    @url = new_authentications_magic_session_url(token: authentication.magic_login_token)

    mail to: authentication.email, subject: "Magic Login"
  end
end
