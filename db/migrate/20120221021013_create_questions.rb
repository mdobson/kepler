class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      t.integer :study_id
      t.integer :user_id
      t.boolean :correct

      t.timestamps
    end
  end
end
