class AddUuidToDatum < ActiveRecord::Migration
  def change
    add_column :data, :uuid, :string
  end
end
