require 'test_helper'

class Authentications::MagicSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get authentications_magic_sessions_new_url
    assert_response :success
  end

end
