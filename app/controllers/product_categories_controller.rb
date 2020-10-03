class ProductCategoriesController < ApplicationController

  def index
    @user = current_user
    @product_categories = ProductCategory.all
  end

  def new
    @user = current_user
    @product_category = ProductCategory.new
  end

  def create
    @user = current_user
    @product_category = ProductCategory.new(paroduct_category_params)
    if @product_category.save
      redirect_to product_categories_path
    else
      render 'new'
    end
  end

  private
  def card_params
    params.require(:product_category).permit(:id, :name, :photo)
  end
end
