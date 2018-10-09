class ReviewsController < ApplicationController
  before_action :check_logined, except: %i(index show destroy)
  before_action :find_review, only: %i(edit update)
  before_action :check_permission, only: %i(edit update)


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

  def edit; end

  def update
    if review.update_attributes review_params
      flash[:success] = t(".update_successfully")
      redirect_to edit_review_path(params[:id])
    else
      flash[:danger] = t(".update_fail")
      redirect_to edit_review_path(params[:id])
    end
  end


  private

  attr_reader :review

  def find_review
    @review = Review.find_by id: params[:id]
  end

  def review_params
    params.require(:review).permit Review::ATTRIBUTES_PARAMS
  end

  def check_permission
    unless current_user == review.user
      flash[:danger] = t(".not_permission")
      redirect_to root_path
    end
  end
end
