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
    @product_category = ProductCategory.new(product_category_params)
    if @product_category.save
      redirect_to product_categories_path
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
    @product_category = ProductCategory.find(params[:id])
  end

  def update
    @user = current_user
    @product_category = ProductCategory.find(params[:id])
    if @product_category.update(product_category_params)
      redirect_to product_categories_path
    else
      render 'edit'
    end
  end

  private
  def product_category_params
    params.require(:product_category).permit(:id, :naam, :photo)
  end
end
