class RenameProdCatName < ActiveRecord::Migration[5.2]
  def change
    rename_column :product_categories, :name, :naam
  end
end
