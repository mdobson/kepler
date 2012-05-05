class Field < ActiveRecord::Base
	belongs_to :form

	def self.create_field(form_id, json_array)
		field = Field.new
		field.form_id = form_id
		field.metadata = json_array
		field.save
	end
end
