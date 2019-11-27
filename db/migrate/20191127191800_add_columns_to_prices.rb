class AddColumnsToPrices < ActiveRecord::Migration[5.0]
  def change
    add_column :prices, :value2, :decimal
  end
end
