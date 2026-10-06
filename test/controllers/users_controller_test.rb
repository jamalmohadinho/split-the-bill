require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get signup form" do
    get signup_url
    assert_response :success
  end

  test "should create user and log in" do
    assert_difference("User.count", 1) do
      post users_url, params: { user: {
        name: "New User", email: "signup@example.com",
        password: "password", password_confirmation: "password"
      } }
    end
    assert_redirected_to trips_url
    get trips_url
    assert_response :success
  end

  test "should reject invalid signup" do
    assert_no_difference("User.count") do
      post users_url, params: { user: {
        name: "", email: "invalid@example.com",
        password: "short", password_confirmation: "different"
      } }
    end
    assert_response :success
    get trips_url
    assert_redirected_to login_url
  end
end
