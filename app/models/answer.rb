class Answer < ActiveRecord::Base
	belongs_to :study
	belongs_to :question
	belongs_to :user

	scope :answers_for_question, lambda {|question_id|
		where("question_id = ?", question_id)
	}
end
