class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|

      t.timestamps
      t.belongs_to :user
    end
  end
end
