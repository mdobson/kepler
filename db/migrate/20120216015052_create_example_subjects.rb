class CreateExampleSubjects < ActiveRecord::Migration
  def change
    create_table :example_subjects do |t|
      t.boolean :locked
      t.integer :study_id
      t.string :identifier
      t.float :height
      t.float :weight
      t.string :weight_units
      t.string :height_units
      t.integer :heart_rate
      t.integer :blood_pressure_diastolic
      t.integer :blood_pressure_systolic
      t.integer :pulse_ox

      t.timestamps
    end
  end
end
