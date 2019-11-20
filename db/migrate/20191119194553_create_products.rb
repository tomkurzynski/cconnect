class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :image_url
      t.string :category
      t.string :brand
      t.decimal :weight

      t.timestamps
    end
  end
end
