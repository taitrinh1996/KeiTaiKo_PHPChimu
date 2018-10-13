class CommentsController < ApplicationController
  before_action :find_review, only: :create

  def create
    @comment = review.comments.new comments_params
    comment.user = current_user
    if comment.save
      flash[:success] = t ".comment_success"
      redirect_to review_path(params[:review_id])
    else
      flash[:danger] = t ".comment_fail"
      redirect_to review_path(params[:review_id])
    end
  end

  private

  attr_reader :comment, :review

  def find_review
    binding.pry
    @review = Review.find_by id: params[:review_id]
  end

  def comments_params
    params.require(:comment).permit Comment::ATTRIBUTES_PARAMS
  end
end
