require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should prompt for login" do
    get login_url
    assert_response :success
  end

  test "should login" do
    ben = users :one
    post login_url, params: { name: ben.name, password: 'babar3' }
    assert_redirected1-to admin_url
    assert_equal ben.id, session[:user_id]
  end

  test "should fail login" do
    ben = users :one
    post login_url, params: { name: ben.name, password: 'wrong' }
    assert_redirected_to login_url
  end

  test "should logout" do
    delete logout_url
    assert_redirected_to store_index_url
  end
  

end
