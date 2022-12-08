class CitysController < ApplicationController
  before_action :set_city, only: [:show, :edit, :update, :destroy]
  def index
    @cities = City.all
  end

  def show
  end

  def new
    @city = City.new
  end

  def create
    @city = City.new(citys_params)
    if @city.save
      redirect_to @city, notice: 'City was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @city.update(citys_params)
      redirect_to @city, notice: 'City was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @city.destroy
    redirect_to cities_url, notice: 'City was successfully destroyed.'
  end

  private

  def set_city
    @city = City.find(params[:id])
  end

  def citys_params
    params.require(:city).permit(:name, :country_id)
  end
end
