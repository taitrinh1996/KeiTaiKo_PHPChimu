class Admin::ReviewsController < ApplicationController
  before_action :check_admin

  def index
    @reviews = Review.order("created_at DESC").page params[:page]
  end

  def update
    @review = Review.find_by id: params[:id]
    binding.pry
    review.toggle(:is_confirm)
    if review.save
      respond_to do |format|
        format.js
      end
    end
  end

  private

  attr_reader :review

  def check_admin
    unless current_user.is_admin?
      flash[:danger] = t ".not_permission"
    end
  end
end
