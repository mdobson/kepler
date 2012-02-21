class AddIndexesToAnswerAndQuestionTables < ActiveRecord::Migration
  def self.up
  	add_index :questions, [:study_id, :user_id]
  	add_index :answers, [:study_id, :user_id]
  end
end
