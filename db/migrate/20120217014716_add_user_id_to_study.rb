class AddUserIdToStudy < ActiveRecord::Migration
  def change
    add_column :studies, :user_id, :integer
  end
end
