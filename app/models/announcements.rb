class Announcements < ActiveRecord::Base
	belongs_to :study
	belongs_to :user

  scope :post_by_study_and_id, lambda { |study_id, post_id|
    where("study_id = ? and id = ?", study_id, post_id)
  }

  scope :posts_by_study, lambda { |study_id|
    where("study_id = ?", study_id)
  }
end
