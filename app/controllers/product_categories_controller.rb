class ProductCategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @user = current_user
    @product_categories = ProductCategory.all
  end

  def show
    @product_category = ProductCategory.find(params[:id])
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

  def destroy
    @user = current_user
    @product_category = ProductCategory.find(params[:id])
    if @product_category.destroy
      redirect_to product_categories_path, success: "Product categorie verwijdert"
    else
      redirect_to product_categories_path, error: "Er is iets fout gegaan"
    end
  end

  private
  def product_category_params
    params.require(:product_category).permit(:id, :naam, :photo, :banner,
      products_attributes: [:id, :naam, :omschrijving, :prijs])
  end
end
