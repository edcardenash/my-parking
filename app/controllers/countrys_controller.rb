class CountrysController < ApplicationController
  before_action :set_country, only: [:show, :edit, :update, :destroy]

  def index
    @countries = Country.all
  end

  def show
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      redirect_to country_path(@country), notice: 'Country was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @country.update(country_params)
      redirect_to country_path(@country), notice: 'Country was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @country.destroy
    redirect_to countries_url, notice: 'Country was successfully destroyed.'
  end

  private

  def countries_params
    params.require(:countries).permit(:name)
  end

  def set_country
    @country = Country.find(params[:id])
  end
end
