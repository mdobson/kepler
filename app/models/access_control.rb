class AccessControl < ActiveRecord::Base
	belongs_to :user
	belongs_to :study
end
