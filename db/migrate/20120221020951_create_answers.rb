class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :answer
      t.integer :study_id
      t.integer :user_id
      t.boolean :correct

      t.timestamps
    end
  end
end
