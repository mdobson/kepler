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

	delegate :email, :to => :user

	def is_user_agent_mobile(request)
		case request.env['HTTP_USER_AGENT']
			when /iPhone/ then true
			when /iPad/ then true
			when /Android/ then true
			else false
		end
	end

	def self.update_form(form, parameter, published)
		if parameter == "publish"
      		form.is_published = published
    	end
    	form.save
	end
end
