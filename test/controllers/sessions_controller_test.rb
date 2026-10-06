require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(name: "Test User", email: "session@example.com", password: "password")
  end

  test "should get login form" do
    get login_url
    assert_response :success
  end

  test "should log in with valid credentials" do
    post login_url, params: { email: @user.email, password: "password" }
    assert_redirected_to trips_url
    get trips_url
    assert_response :success
  end

  test "should reject invalid credentials" do
    post login_url, params: { email: @user.email, password: "incorrect" }
    assert_response :success
    get trips_url
    assert_redirected_to login_url
  end

  test "should log out" do
    post login_url, params: { email: @user.email, password: "password" }
    get logout_url
    assert_redirected_to login_url
    get trips_url
    assert_redirected_to login_url
  end
end
