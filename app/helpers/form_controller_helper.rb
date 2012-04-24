module FormControllerHelper
	def convert_form_data_type(field)
		case field.field_type
			when "Text"
				return text_field_tag(field.field_name)
			when "Number"
				return text_field_tag(field.field_name)
			when "Check Box"
				return check_box_tag(field.field_name)
			when "Select"
				return select_tag(field.field_name, options_for_select([[1],[2],[3]]))
		end
	end
end
