class AddValueToPrice < ActiveRecord::Migration[5.0]
  def change
    add_column :prices, :value, :decimal
  end
end
