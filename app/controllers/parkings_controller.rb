class ParkingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_parking, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @parkings = Parking.global_search(params[:query])
    else
      @parkings = Parking.all
    end
    @markers = show_map
    @parkings = policy_scope(Parking)
  end

  def show
    authorize @parking
    @parking = Parking.find(params[:id])
    @rental = Rental.new
    @review = Review.new
    @parkings = Parking.all
    @markers = show_map
  end

  def new
    @parking = Parking.new
    authorize @parking
  end

  def create
    @parking = Parking.new(parkings_params)
    @parking.user = current_user
    authorize @parking
    @parking.rented = false
    @parking.user_id = current_user.id
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
    redirect_to parking_path, notice: 'Parking was successfully destroyed.'
  end

  def my_parkings
    @parkings = current_user.parkings
    @markers = show_map
    authorize @parkings
  end

  private

  def set_parking
    @parking = Parking.find(params[:id])
  end

  def parkings_params
    params.require(:parking).permit(:name, :address, :price_per_day, :description, :covered, :vehicle_type, :rented, :photo, :city_id)
  end

  def show_map
    return @parkings.geocoded.map do |parking|
      {
        lat: parking.latitude,
        lng: parking.longitude,
        # info_window: render_to_string(partial: "info_window", locals: {parking: parking}),
        # image_url: helpers.asset_url("logo.png")
      }
    end
  end
end
