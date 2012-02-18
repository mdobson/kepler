class AddIndexToTables < ActiveRecord::Migration
  def self.up
    add_index :studies, [:id]
    add_index :announcements, [:study_id, :user_id]
    add_index :access_controls, [:study_id, :user_id]
  end
end
