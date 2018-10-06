class Brand < ApplicationRecord
  has_many :brand

  validates :name, presence: true, length: {maximum: 100}
end
