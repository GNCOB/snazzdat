class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :sender
      t.string :receiver
      t.string :city
      t.string :email
      t.string :zip_code

      t.timestamps
      t.belongs_to :user
    end
  end
end
