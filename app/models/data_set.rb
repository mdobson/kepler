class DataSet < ActiveRecord::Base
	belongs_to :form
	belongs_to :study

	scope :get_data_sets_by_study_id, lambda{|study_id|
		where("study_id = ?", study_id)
	}

	scope :get_last_entered_date, lambda{|form_id|
		where("form_id = ?", form_id).order("updated_at ASC").first
	}

	scope :get_ordered_forms_by_study_id, lambda{|study_id|
		select("form_id, count(*) as rec_count").where("study_id = ?", study_id).group("form_id")
	}
end
