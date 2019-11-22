class AddPhonenumberToSiteContents < ActiveRecord::Migration[5.0]
  def change
    add_column :site_contents, :phonenumber, :string
  end
end
