class AddHstoreColumnToForm < ActiveRecord::Migration
  def change
    add_column :forms, :meta_data, :hstore
  end
end
