class AddRequiredFormFieldToForm < ActiveRecord::Migration
  def change
    add_column :forms, :required_form_id, :integer
    add_column :forms, :can_be_used_multiple_times, :boolean
    add_column :forms, :subject_auto_complete_field, :string
    add_column :forms, :subject_auto_complete_form, :integer
  end
end
