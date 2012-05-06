class AddIsPublishedToForm < ActiveRecord::Migration
  def change
    add_column :forms, :is_published, :boolean
  end
end
