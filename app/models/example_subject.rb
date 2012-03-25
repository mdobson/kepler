class ExampleSubject < ActiveRecord::Base
	belongs_to :study
	belongs_to :user

	delegate :email, :to => :user

	scope :retrieve_by_study_and_identifier, lambda{|study_id, subj_id| 
		where("study_id = ? and id = ?", study_id, subj_id)}
end
