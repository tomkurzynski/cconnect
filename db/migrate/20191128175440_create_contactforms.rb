class CreateContactforms < ActiveRecord::Migration[5.0]
  def change
    create_table :contactforms do |t|
      t.string :contactname
      t.string :contactemail
      t.text :contactmessage

      t.timestamps
    end
  end
end
