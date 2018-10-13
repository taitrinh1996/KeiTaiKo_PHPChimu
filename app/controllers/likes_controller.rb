class LikesController < ApplicationController
  before_action :find_object
  before_action :find_like, only: :destroy

  def create
    @like = current_user.likes.new
    like.review_id = params[:review_id]
    if like.save
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    if like.destroy
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js
      end
    end
  end

  private

  attr_reader :like, :object

  def find_object
    @object = Review.find_by id: params[:review_id]
  end

  def find_like
    @like = Like.find_by id: params[:like_id]
  end
end
