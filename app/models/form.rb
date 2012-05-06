class Form < ActiveRecord::Base
	belongs_to :study
	belongs_to :user
	has_many :fields
	has_many :data_sets

	scope :get_forms_by_study_id, lambda {|study_id|
		where("study_id = ?", study_id)
	}

	scope :get_form_by_form_id, lambda{|id|
		where("id = ?", id)
	}
end
