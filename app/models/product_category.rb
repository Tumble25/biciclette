class ProductCategory < ApplicationRecord
  has_one_attached :photo
  has_many :products
end
