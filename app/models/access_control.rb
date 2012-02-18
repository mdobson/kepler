class AccessControl < ActiveRecord::Base
	belongs_to :user
	belongs_to :study

	validates_uniqueness_of :user_id, :scope => :study_id

  scope :for_user_in_study, lambda { |user_id, study_id|
      where("user_id = ? and study_id = ?", user_id, study_id)
  }
  
  scope :user_studies, lambda { |user_id|
	  	where("user_id = ?", user_id)
  }
  
  scope :all_users_in_study, lambda { |study_id|
	  where("study_id = ?", study_id)
  }
  
end
