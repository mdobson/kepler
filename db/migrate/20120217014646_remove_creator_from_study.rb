class RemoveCreatorFromStudy < ActiveRecord::Migration
  def up
    remove_column :studies, :creator
  end

  def down
    add_column :studies, :creator, :integer
  end
end
