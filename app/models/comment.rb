class Comment < ApplicationRecord
  ATTRIBUTES_PARAMS = %i(content user_id review_id parent_id)
  belongs_to :user
  belongs_to :review

  validates :content, presence: true, length: {maximum: 255}
  validates :user_id, presence: true
  validates :review_id, presence: true

  lambda_find_sub_comments = lambda do |parent_id|
    where parent_id: parent_id
  end

  scope :find_sub_comments, lambda_find_sub_comments
end
