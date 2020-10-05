class CreateProductPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :product_photos do |t|
      t.string :photo
      t.boolean :profile_picture
      t.references :product, index: true, foreign_key: true
      t.timestamps
    end
  end
end
