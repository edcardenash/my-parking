class RentalsController < ApplicationController
  before_action :set_rent, only: [:show, :edit, :update, :destroy]
  def index
    @rentals = current_user.rentals
  end

  def show
  end

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rentals_params)
    if @rental.save
      redirect_to @rental, notice: 'Rental was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @rental.update(rentals_params)
      redirect_to @rental, notice: 'Rental was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @rental.destroy
    redirect_to rents_url, notice: 'Rental was successfully destroyed.'
  end

  private

  def set_rent
    @rental = Rental.find(params[:id])
  end

  def rentals_params
    params.require(:rental).permit(:start_date, :end_date, :total_amount)
  end
end
