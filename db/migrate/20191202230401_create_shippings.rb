class CreateShippings < ActiveRecord::Migration[5.0]
  def change
    create_table :shippings do |t|
      t.string :Line_1
      t.string :Line_2
      t.string :Line_3

      t.timestamps
    end
  end
end
