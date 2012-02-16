class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :title
      t.text :content
      t.integer :study_id
      t.integer :user_id

      t.timestamps
    end
  end
end
