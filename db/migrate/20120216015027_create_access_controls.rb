class CreateAccessControls < ActiveRecord::Migration
  def change
    create_table :access_controls do |t|
      t.integer :study_id
      t.integer :user_id
      t.boolean :is_admin
      t.boolean :can_read
      t.boolean :can_write

      t.timestamps
    end
  end
end
