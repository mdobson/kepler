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

	def self.update_publish_status(form, parameter, published)
		if parameter == "publish"
      		form.is_published = published
    	end
    	form.save
	end

	def self.create_new_form(params, user_id)
      @form = Form.new
      @form.name = params[:name]
      @form.study_id = params[:study_id]
      @form.user_id = user_id
      @form.is_published = false
      @form.is_mobile = false
      flag = {}
      if @form.save
        params[:fields].each do |field|
          Field.create_field(@form.id, field)
        end
      	flag["success"] = true
      else
      	flag["success"] = false
      end
      return flag
	end

	def self.update_old_form(params)
	  @form = Form.get_form_by_form_id(params[:formid]).first
      @form.name = params[:name]
      flag = {}
      @form.fields.each do |field|
        field.destroy
      end
      if @form.save
        params[:fields].each do |field|
          Field.create_field(@form.id, field)
        end
      	flag["success"] = true
      else
      	flag["success"] = false
      end
      return flag
	end

	def self.to_json(params)
	  @form = Form.get_form_by_form_id(params[:id]).first
      fields = @form.fields
      responseFields = []
      fields.each do |field_data|
        responseFields.push(field_data.metadata)
      end
      responseStruct = {}
      responseStruct["name"] = @form.name
      responseStruct["fields"] = responseFields.to_json
      return responseStruct
	end
end
