class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
    @reviews = policy_scope(Review)
  end

  def show
  end

  def new
    @parking = Parking.find(params[:parking_id])
    @review = Review.new
    authorize @review
  end

  def create
    @parking = Parking.find(params[:parking_id])
    @review = Review.new(reviews_params)
    @review.parking = @parking
    authorize @review
    @review.user_id = current_user.id
    if @review.save
      redirect_to parking_path(@parking), notice: "Review was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    authorize @review
    @parking = Parking.find(params[:parking_id])
    if @review.update(review_params)
      redirect_to parking_path(@parking), notice: "Review was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @review
    @review.destroy
    redirect_to reviews_url, notice: "Review was successfully destroyed."
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def reviews_params
    params.require(:review).permit(:comment, :rating)
  end
end
