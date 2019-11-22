class AddAddressToSiteContents < ActiveRecord::Migration[5.0]
  def change
    add_column :site_contents, :address, :string
  end
end
