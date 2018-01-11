class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.secrets.sender_mail_address
  layout 'mailer'
end
