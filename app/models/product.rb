class Product < ApplicationRecord
  # has_many_attached :photos
  has_many :product_photos, dependent: :destroy
  belongs_to :product_category
  accepts_nested_attributes_for :product_photos, reject_if: :all_blank, allow_destroy: true
end
