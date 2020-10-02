class RenameProductensToProductssss < ActiveRecord::Migration[5.2]
  def change
    rename_table :productens, :products
  end
end
