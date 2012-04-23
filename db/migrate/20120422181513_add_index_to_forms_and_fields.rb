class AddIndexToFormsAndFields < ActiveRecord::Migration
  def change
  	add_index :forms, [:study_id,:user_id]
  	add_index :fields, :form_id
  end
end
