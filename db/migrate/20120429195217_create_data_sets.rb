class CreateDataSets < ActiveRecord::Migration
  def change
    create_table :data_sets do |t|
      t.integer :form_id
      t.string :uuid
      t.hstore :data_set

      t.timestamps
    end
  end
end
