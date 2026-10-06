require "test_helper"

class TripsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(name: "Test User", email: "trip@example.com", password: "password")
    @trip = Trip.create!(name: "Test Trip", start_date: "2026-04-20", end_date: "2026-04-22", creator: @user)
    post login_url, params: { email: @user.email, password: "password" }
    assert_redirected_to trips_url
  end

  test "should get index" do
    get trips_url
    assert_response :success
  end

  test "should get show" do
    get trip_url(@trip)
    assert_response :success
  end

  test "should get new" do
    get new_trip_url
    assert_response :success
  end

  test "should create trip" do
    assert_difference("Trip.count", 1) do
      post trips_url, params: { trip: {
        name: "New Trip", start_date: "2026-05-01", end_date: "2026-05-03"
      } }
    end
    trip = Trip.order(:id).last
    assert_redirected_to trip_url(trip)
    assert_equal @user, trip.creator
    assert_includes trip.participants, @user
  end

  test "should get edit" do
    get edit_trip_url(@trip)
    assert_response :success
  end

  test "should update trip" do
    patch trip_url(@trip), params: { trip: { name: "Updated Trip" } }
    assert_redirected_to trip_url(@trip)
    assert_equal "Updated Trip", @trip.reload.name
  end

  test "should destroy trip" do
    assert_difference("Trip.count", -1) do
      delete trip_url(@trip)
    end
    assert_redirected_to trips_url
  end
end
