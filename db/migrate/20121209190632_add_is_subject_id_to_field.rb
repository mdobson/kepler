class AddIsSubjectIdToField < ActiveRecord::Migration
  def change
    add_column :fields, :is_subject_id, :boolean
  end
end
