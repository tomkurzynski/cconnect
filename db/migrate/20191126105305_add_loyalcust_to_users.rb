class AddLoyalcustToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :loyalcust, :boolean, :default => false
  end
end
