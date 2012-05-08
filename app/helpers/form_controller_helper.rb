module FormControllerHelper
	def convert_form_data_type(field)
		case field["datatype"]
			when "Text"
				return text_field_tag(field["datapoint"])
			when "Numeric"
				return text_field_tag(field["datapoint"])
			when "Bool"
				return check_box_tag(field["datapoint"])
			when "Dropdown"
				return select_tag(field["datapoint"], options_for_select([[1],[2],[3]]))
			when "Long"
				return text_area_tag(field["datapoint"], nil, :size => "400x8", :style=>"width:461px;")
		end
	end
end
