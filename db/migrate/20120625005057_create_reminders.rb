class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.integer :study_id
      t.integer :user_id
      t.datetime :last_reminded_date
      t.integer :interval
      t.string :contact_method
      t.text :contact_information

      t.timestamps
    end
  end
end
