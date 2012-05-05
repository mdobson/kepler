class Field < ActiveRecord::Base
	belongs_to :form

	def self.create_field(form_id, json_array)
		field = Field.new
		field.form_id = form_id
		field.field_name = json_array["datapoint"]
		field.field_type = json_array["datatype"]
		field.field_question = json_array["question"]
		field.save
	end
end
