class AddOneMoreIndex < ActiveRecord::Migration
  def self.up
  	add_index :answers, :question_id
  end

  def down
  end
end
