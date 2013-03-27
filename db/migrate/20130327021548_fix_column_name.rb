class FixColumnName < ActiveRecord::Migration
  def up
  	rename_column :fields, :field_name, :name
  	rename_column :fields, :field_type, :type
  	rename_column :fields, :field_helptext, :helptext
  	rename_column :fields, :field_isnull, :isnull
  	rename_column :fields, :field_question, :question
  end

  def down
  end
end
