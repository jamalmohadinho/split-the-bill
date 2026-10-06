require "test_helper"

class ExpensesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create!(name: "Test User", email: "expense@example.com", password: "password")
    @trip = Trip.create!(name: "Test Trip", start_date: "2026-04-20", end_date: "2026-04-22", creator: @user)
    @trip.participants << @user
    post login_url, params: { email: @user.email, password: "password" }
    assert_redirected_to trips_url
  end

  test "should get new" do
    get new_trip_expense_url(@trip)
    assert_response :success
  end

  test "should create expense" do
    assert_difference("Expense.count", 1) do
      post trip_expenses_url(@trip), params: { expense: {
        description: "Dinner", amount: "25.50", date: "2026-04-20",
        category: "Food", participant_ids: [ @user.id ]
      } }
    end
    expense = Expense.order(:id).last
    assert_redirected_to trip_url(@trip)
    assert_equal @trip, expense.trip
    assert_equal @user, expense.paid_by
    assert_equal BigDecimal("25.50"), expense.amount
    assert_includes expense.participants, @user
  end

  test "should destroy expense" do
    expense = @trip.expenses.create!(description: "Dinner", amount: 25, date: "2026-04-20", paid_by: @user)
    assert_difference("Expense.count", -1) do
      delete trip_expense_url(@trip, expense)
    end
    assert_redirected_to trip_url(@trip)
  end
end
