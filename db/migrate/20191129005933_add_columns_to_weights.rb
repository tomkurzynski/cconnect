class AddColumnsToWeights < ActiveRecord::Migration[5.0]
  def change
    add_column :weights, :value, :decimal
    add_column :weights, :value2, :decimal
  end
end
