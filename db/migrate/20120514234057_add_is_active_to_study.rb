class AddIsActiveToStudy < ActiveRecord::Migration
  def change
    add_column :studies, :is_active, :boolean
  end
end
