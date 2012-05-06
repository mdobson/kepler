class AddMetadataToField < ActiveRecord::Migration
  def change
    add_column :fields, :metadata, :hstore
  end
end
