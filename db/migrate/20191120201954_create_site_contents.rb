class CreateSiteContents < ActiveRecord::Migration[5.0]
  def change
    create_table :site_contents do |t|
      t.string :title
      t.string :header1
      t.string :header2
      t.string :description1
      t.string :description2
      t.string :image

      t.timestamps
    end
  end
end
