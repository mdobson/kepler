class ExampleSubject < ActiveRecord::Base
	belongs_to :study
	belongs_to :user
end
