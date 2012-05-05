module FormControllerHelper
	def convert_form_data_type(field)
		case field["datatype"]
			when "Text"
				return text_field_tag(field["datapoint"])
			when "Numeric"
				return text_field_tag(field["datapoint"])
			when "Checkbox"
				return check_box_tag(field["datapoint"])
			when "Select"
				return select_tag(field["datapoint"], options_for_select([[1],[2],[3]]))
		end
	end

	def generate_form_builder_link(form_id)
		return "#{study_form_builder_index_path}##{form_id}"
	end
end
