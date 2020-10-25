class AddBannerToProductCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :product_categories, :banner, :string
  end
end
