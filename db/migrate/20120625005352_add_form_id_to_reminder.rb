class AddFormIdToReminder < ActiveRecord::Migration
  def change
    add_column :reminders, :form_id, :integer
  end
end
