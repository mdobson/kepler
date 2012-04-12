class CreateDemosurveys < ActiveRecord::Migration
  def change
    create_table :demosurveys do |t|
      t.integer :franchise_num
      t.integer :marketing_materials
      t.integer :training_materials
      t.boolean :new_system
      t.string :greatest_benefit
      t.text :commentary

      t.timestamps
    end
  end
end
