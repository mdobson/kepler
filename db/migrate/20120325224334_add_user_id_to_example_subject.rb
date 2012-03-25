class AddUserIdToExampleSubject < ActiveRecord::Migration
  def change
    add_column :example_subjects, :user_id, :integer
  end
end
