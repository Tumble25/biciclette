class Product < ApplicationRecord
  has_many_attached :photos
  belongs_to :product_category
end
