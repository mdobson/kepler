class Field < ActiveRecord::Base
	belongs_to :form

	def self.create_field(form_id, json_array)
		field = Field.new
		field.form_id = form_id
		field.field_name = json_array["name"]
		field.field_type = json_array["datatype"]
		field.field_helptext = json_array["helptext"]
		field.field_question = json_array["question"]
		if json_array["blank"] == "checked"
			field.field_isnull = true
		else
			field.field_isnull = false
		end
		field.save
	end
end
