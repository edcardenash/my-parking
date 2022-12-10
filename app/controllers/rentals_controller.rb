class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :destroy]
  before_action :authenticate_user!, only: :create

  def index
    @rentals = Rental.all.where(user_id: current_user.id)
  end

  def create
    @parking = Parking.find(params[:parking_id])
    @rental = Rental.new(rental_params)
    @rental.parking = @parking
    @rental.total_amount = (@rental.end_date - @rental.start_date).to_f * @rental.parking.price_per_day
    @rental.user_id = current_user.id
    @rental.parking_id = @parking.id
    if @rental.save
      redirect_to parking_path(@parking)
    else
      redirect_to root_path
    end
  end

  def destroy
    @rental.destroy
    redirect_to user_path(current_user)
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :total_amount, :user_id, :parking_id)
  end
end
