class ParkingsController < ApplicationController
  before_action :set_parking, only: [:show, :edit, :update, :destroy]
  def index
    @parkings = Parking.all
  end

  def show
  end

  def new
    @parking = Parking.new
  end

  def create
    @parking = Parking.new(parkings_params)
    if @parking.save
      redirect_to @parking, notice: 'Parking was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @parking.update(parkings_params)
      redirect_to @parking, notice: 'Parking was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @parking.destroy
    redirect_to parking_url, notice: 'Parking was successfully destroyed.'
  end

  private

  def set_parking
    @parking = Parking.find(params[:id])
  end

  def parkings_params
    params.require(:parking).permit(:name, :address, :price_per_day, :description, :covered, :vehicle_type, :rented)
  end
end
