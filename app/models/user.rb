class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  has_many :liked, class_name: Like.name, dependent: :destroy
  has_many :liked_review, through: :liked, source: :review
  has_many :commented, class_name: Comment.name, dependent: :destroy
  has_many :commented_review, through: :commented, source: :review

  mount_uploader :picture, PictureUploader

  validates :email, presence: true, 
    format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :name, presence: true, length: {maximum: 30, minimum: 6}
end
