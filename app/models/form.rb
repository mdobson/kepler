class Form < ActiveRecord::Base
	belongs_to :study
	belongs_to :user
	has_many :fields

	scope :get_forms_by_study_id, lambda {|study_id|
		where("study_id = ?", study_id)
	}
end
