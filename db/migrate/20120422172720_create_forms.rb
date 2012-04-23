class CreateForms < ActiveRecord::Migration
  def change
    create_table :forms do |t|
      t.integer :study_id
      t.integer :user_id

      t.timestamps
    end
  end
end
