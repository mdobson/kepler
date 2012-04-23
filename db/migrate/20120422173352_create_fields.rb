class CreateFields < ActiveRecord::Migration
  def change
    create_table :fields do |t|
      t.integer :form_id
      t.string :field_name
      t.string :field_type
      t.string :field_helptext
      t.boolean :field_isnull

      t.timestamps
    end
  end
end
