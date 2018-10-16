class CommentsController < ApplicationController
  before_action :find_review, only: [:create, :destroy]
  before_action :find_comment, only: :destroy
  before_action :check_permission, only: :destroy

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

  def destroy
    @review = comment.review
    if comment.destroy
      flash[:success] = t ".delete_success"
      redirect_to review
    else
      flash[:danger] = t ".delete_fail"
      redirect_to review
    end
  end

  private

  attr_reader :comment, :review

  def check_permission
    unless comment.user == current_user
      flash[:danger] = t ".not_permission"
      redirect_to review
    end
  end

  def find_review
    @review = Review.find_by id: params[:review_id]
  end

  def find_comment
    @comment = Comment.find_by id: params[:id]
  end

  def comments_params
    params.require(:comment).permit Comment::ATTRIBUTES_PARAMS
  end
end
