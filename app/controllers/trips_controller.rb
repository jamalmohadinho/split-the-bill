class TripsController < ApplicationController
  before_action :require_login
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  def index
    @trips = current_user.trips
  end

  def show
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.creator = current_user
    if @trip.save
      @trip.participants << current_user

      if params[:trip][:participant_ids].present?
        participants = User.where(id: params[:trip][:participant_ids])
        @trip.participants << participants
      end

      redirect_to trip_path(@trip), notice: "Trip created successfully!"
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @trip.update(trip_params)
      redirect_to trip_path(@trip), notice: "Trip updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @trip.destroy
    redirect_to trips_path, notice: "Trip deleted successfully!"
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(:name, :start_date, :end_date)
  end
end
