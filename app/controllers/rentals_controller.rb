class RentalsController < ApplicationController
  before_action :set_rental, only: [:destroy]
  before_action :authenticate_user!, only: :create

  def index
    @rentals = Rental.all.where(user_id: current_user.id)
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    @parking = Parking.find(params[:parking_id])
    @rental.parking = @parking
    @rental.total_amount = (@rental.end_date - @rental.start_date).to_i * @rental.parking.price_per_day.to_i
    if @rental.save
      flash[:notice] = '¡Su reserva ha sido procesada'
      redirect_to root_path
    else
      flash[:notice] = 'Lo sentimos, fechas nos disponibles'
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
