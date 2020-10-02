class CreateProductens < ActiveRecord::Migration[5.2]
  def change
    create_table :productens do |t|
      t.string :naam
      t.text :omschrijving
      t.decimal :prijs, :precision => 15, :scale => 2

      t.timestamps
    end
  end
end
