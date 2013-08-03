class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.text :address1
      t.text :address2
      t.text :city
      t.text :state
      t.integer :zip_code
      t.text :country

      t.timestamps
    end
  end
end
