class RenameProductensToProducts < ActiveRecord::Migration[5.2]
  def change
    def self.up
      rename_table :productens, :products
    end

    def self.down
      rename_table :products, :productens
    end
  end
end
