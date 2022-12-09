class RentalsController < ApplicationController
  before_action :set_parking, only: [:new, :create]
  def index
    @rentals = Rental.all.where(user_id: current_user.id)
  end

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.parking = @parking
    @rental.user = current_user
    if @rental.save
      redirect_to parking_rentals_path(@parking)
    else
      redirect_to parking_path(@parking)
    end
  end

  private

  def set_parking
    @parking = Parking.find(params[:parking_id])
  end

  def rentals_params
    params.require(:rental).permit(:start_date, :end_date, :total_amount, :parking_id)
  end
end
