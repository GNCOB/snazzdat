class AddColumnsToSizes < ActiveRecord::Migration
  def change
    add_column :sizes, :waist, :float
    add_column :sizes, :hips, :float
    add_column :sizes, :neck, :float
    add_column :sizes, :shoulder, :float
    add_column :sizes, :inseam, :float
    add_column :sizes, :height, :float
    add_column :sizes, :foot, :float
    add_column :sizes, :bust, :float
    add_column :sizes, :back, :float
  end
end
