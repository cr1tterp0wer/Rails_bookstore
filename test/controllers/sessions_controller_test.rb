require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest

  test "should prompt for login" do 
    get login_url
    assert_response :success
  end

  test "should login" do
    dave = users(:one)
    post login_url, params: { username: dave.username, password: 'secret' }
    assert_redirected_to admin_url
    assert_equal session[:user_id], dave.id
  end

  test "should fail login" do
    dave = users(:one)
    post login_url(dave), params: { username: dave.username, password: 'wrong' }
    assert_redirected_to login_url
  end

  test "should logout" do 
    delete logout_url
    assert_redirected_to store_index_url
  end

end
