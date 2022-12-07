class CountrysController < ApplicationController
  before_action :set_country

  def index
    @countries = Country.all
  end

  def show
    @country = Country.find(set_country)
  end

  private

  def countries_params
    params.require(:countries).permit(:name)
  end

  def set_country
    @country = Country.find(params[:id])
  end
end
