class ParkingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_parking, only: [:show, :edit, :update, :destroy]

  def index
    @parkings = Parking.all
    @parkings = policy_scope(Parking)
  end

  def show
    authorize @parking
    if params[:query].present?
      @parkings = Parking.global_search(params[:query])
    else
      @parkings = Parking.all
    end
  end

  def show

    @parking = Parking.find(params[:id])
    @rental = Rental.new
    @review = Review.new
  end

  def new
    @parking = Parking.new
    authorized @parking
  end

  def create
    @parking = Parking.new(parkings_params)
<<<<<<< HEAD
    @parking.user = current_user
    authorized @parking
=======
    @parking.user_id = current_user.id
>>>>>>> master
    if @parking.save
      redirect_to @parking, notice: 'Parking was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @parking
  end

  def update
    authorize @parking
    if @parking.update(parkings_params)
      redirect_to @parking, notice: 'Parking was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @parking
    @parking.destroy
    redirect_to parking_url, notice: 'Parking was successfully destroyed.'
  end

  private

  def set_parking
    @parking = Parking.find(params[:id])
  end

  def parkings_params
    params.require(:parking).permit(:name, :address, :price_per_day, :description, :covered, :vehicle_type, :rented, :city_id)
  end
end
