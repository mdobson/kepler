class CreateStudies < ActiveRecord::Migration
  def change
    create_table :studies do |t|
      t.string :title
      t.text :description
      t.integer :creator

      t.timestamps
    end
  end
end
