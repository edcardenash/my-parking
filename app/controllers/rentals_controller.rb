class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :destroy]

  def index
    @rentals = Rental.all.where(user_id: current_user.id)
    @rentals = policy_scope(Rental)
  end

  def show
    authorize @rental
    @rental = Rental.find(params[:id])
    @parking = @rental.parking
  end

  def create
    @parking = Parking.find(params[:parking_id])
    @rental = Rental.new(rental_params)
    @rental.parking = @parking
    @rental.total_amount = (@rental.end_date - @rental.start_date).to_f * @rental.parking.price_per_day
    authorize @rental
    @rental.user_id = current_user.id
    @rental.parking_id = @parking.id
    if @rental.save
      @parking.rented = true
      @parking.save
      redirect_to rental_path(@rental)
    else
      redirect_to root_path
    end
  end

  def destroy
    @rental = Rental.find(params[:id])
    authorize @rental
    @parking_id = @rental.parking_id
    @parking = Parking.find(@parking_id)
    @parking.rented = false
    @parking.save
    @rental.destroy
    redirect_to rentals_path, status: :see_other
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def rental_params
    params.require(:rental).permit(:start_date, :end_date, :total_amount, :user_id, :parking_id)
  end
end
