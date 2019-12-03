class AddClientIdToShippings < ActiveRecord::Migration[5.0]
  def change
    add_column :shippings, :clientId, :integer
  end
end
