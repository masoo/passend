require 'test_helper'

class Messages::AcceptancesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get messages_acceptances_index_url
    assert_response :success
  end

  test "should get show" do
    get messages_acceptances_show_url
    assert_response :success
  end

end
