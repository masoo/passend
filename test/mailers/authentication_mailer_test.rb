require 'test_helper'

class AuthenticationMailerTest < ActionMailer::TestCase
  test "magic_login_email" do
    mail = AuthenticationMailer.magic_login_email
    assert_equal "Magic login email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
