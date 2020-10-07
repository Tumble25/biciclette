class ProductPhotosController < ApplicationController
  def new
    @user = current_user
    @product_category = ProductCategory.find(params[:product_category_id])
    @product = Product.new
    # @product.product_photos.build
  end

end
