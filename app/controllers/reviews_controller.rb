class ReviewsController < ApplicationController
  before_action :check_logined, only: [:new, :create]

  def new
    @review = current_user.reviews.new
  end

  def create
    @review = current_user.reviews.new review_params
    if review.save
      flash[:success] = t(".create_successfully")
      redirect_to root_path
    else
      flash[:danger] = t(".create_fail")
      redirect_to new_review_path
    end
  end

  private

  attr_reader :review

  def review_params
    params.require(:review).permit Review::ATTRIBUTES_PARAMS
  end
end
