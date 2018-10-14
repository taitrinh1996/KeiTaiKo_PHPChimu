class Brand < ApplicationRecord
  has_many :reviews

  validates :name, presence: true, length: {maximum: 100}
end
