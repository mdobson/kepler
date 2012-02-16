class Study < ActiveRecord::Base
	has_many :users
	has_many :access_controls
	has_many :example_subjects
	has_many :announcements
end
