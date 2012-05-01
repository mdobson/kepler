class DataSet < ActiveRecord::Base
	belongs_to :form
	belongs_to :study

	scope :get_data_sets_by_study_id, lambda{|study_id|
		where("study_id = ?", study_id)
	}
end
