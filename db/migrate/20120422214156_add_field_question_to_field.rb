class AddFieldQuestionToField < ActiveRecord::Migration
  def change
    add_column :fields, :field_question, :string
  end
end
