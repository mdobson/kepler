class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
      t.integer :study_id
      t.integer :form_id
      t.integer :field_id
      t.string :data_point

      t.timestamps
    end
  end
end
