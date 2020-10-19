class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def new
    @user = current_user
    @product_category = ProductCategory.find(params[:product_category_id])
    @product = Product.new
    # @product.product_photos.build
  end

  def create
    @user = current_user
    @product_category = ProductCategory.find(params[:product_category_id])
    @product = @product_category.products.new(product_params)
    if @product.save
      redirect_to edit_product_category_path(@product_category)
    else
      render 'new'
    end
  end

  def show
    @product_category = ProductCategory.find(params[:product_category_id])
    @product = Product.find(params[:id])
  end

  def edit
    @user = current_user
    @product_category = ProductCategory.find(params[:product_category_id])
    @product = Product.find(params[:id])
  end

  def update
    @user = current_user
    @product_category = ProductCategory.find(params[:product_category_id])
    @product = Product.find(params[:id])
    # binding.pry
    if @product.update(product_params)
      redirect_to edit_product_category_path(@product_category)
    else
      render 'edit'
    end
  end

  def destroy
    @user = current_user
    @product_category = ProductCategory.find(params[:product_category_id])
    @product = Product.find(params[:id])
    if @product.destroy
      redirect_to product_categories_path, success: "Product categorie verwijdert"
    else
      redirect_to product_categories_path, error: "Er is iets fout gegaan"
    end
  end

  private
  def product_params
    params.require(:product).permit(:id, :naam, :omschrijving, :prijs, :product_category_id, product_photos_attributes: [:id, :photo, :product_id, :profile_picture, :_destroy])
  end
end
