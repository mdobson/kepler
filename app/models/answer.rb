class Answer < ActiveRecord::Base
	belongs_to :study
	belongs_to :answer
	belongs_to :user
end
