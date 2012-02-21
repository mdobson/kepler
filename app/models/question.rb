class Question < ActiveRecord::Base
	belongs_to :study
	belongs_to :user
	has_many :answers

	scope :questions_in_study,  lambda {|study_id|
		where("study_id = ?", study_id)
	}
end
