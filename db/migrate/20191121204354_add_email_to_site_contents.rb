class AddEmailToSiteContents < ActiveRecord::Migration[5.0]
  def change
    add_column :site_contents, :email, :string
  end
end
