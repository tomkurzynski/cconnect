class CreateFilters < ActiveRecord::Migration[5.0]
  def change
    create_table :filters do |t|
      t.string :category
      t.decimal :price
      t.string :brand
      t.decimal :weight

      t.timestamps
    end
  end
end
