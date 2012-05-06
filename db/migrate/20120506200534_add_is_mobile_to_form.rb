class AddIsMobileToForm < ActiveRecord::Migration
  def change
    add_column :forms, :is_mobile, :boolean
  end
end
