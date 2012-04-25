class AddDataSetIdToDatum < ActiveRecord::Migration
  def change
    add_column :data, :data_set_id, :integer
  end
end
