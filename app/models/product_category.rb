class ProductCategory < ApplicationRecord
  has_one_attached :photo
  has_one_attached :banner
  has_many :products, dependent: :destroy

end
