require 'test_helper'

class AuthenticationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get authentications_index_url
    assert_response :success
  end

  test "should get show" do
    get authentications_show_url
    assert_response :success
  end

  test "should get new" do
    get authentications_new_url
    assert_response :success
  end

  test "should get create" do
    get authentications_create_url
    assert_response :success
  end

  test "should get edit" do
    get authentications_edit_url
    assert_response :success
  end

  test "should get update" do
    get authentications_update_url
    assert_response :success
  end

  test "should get destroy" do
    get authentications_destroy_url
    assert_response :success
  end

end
