class ExpensesController < ApplicationController
  before_action :require_login
  before_action :set_trip

  def new
    @expense = Expense.new
  end

  def create
    @expense = Expense.new(expense_params)
    @expense.trip = @trip
    @expense.paid_by = current_user
    if @expense.save
      # attach participants to the expense
      participant_ids = params[:expense][:participant_ids] || []
      @expense.participants << User.find(participant_ids)
      redirect_to trip_path(@trip), notice: "Expense added successfully!"
    else
      render :new
    end
  end

  def destroy
    @expense = Expense.find(params[:id])
    @expense.destroy
    redirect_to trip_path(@trip), notice: "Expense deleted successfully!"
  end

  private

  def set_trip
    @trip = Trip.find(params[:trip_id])
  end

  def expense_params
    params.require(:expense).permit(:description, :amount, :date, :category)
  end
end
