class CreateTestprices < ActiveRecord::Migration[5.0]
  def change
    create_table :testprices do |t|
      t.string :title
      t.decimal :value
      t.decimal :value2

      t.timestamps
    end
  end
end
