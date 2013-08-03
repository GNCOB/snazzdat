class AddColumnToSizes < ActiveRecord::Migration
  def change
    add_column :sizes, :user_id, :integer
  end
end
