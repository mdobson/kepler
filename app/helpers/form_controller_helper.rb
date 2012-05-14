module FormControllerHelper
	def convert_form_data_type(field)
		case field["datatype"]
			when "Text"
				return text_field_tag(field["datapoint"])
			when "Numeric"
				return text_field_tag(field["datapoint"])
			when "Bool"
				return content_tag :div, :class=>"controls" do 
					content_tag(:label, radio_button_tag(field["datapoint"], true) + "True".html_safe, :class=>"radio",) +
					content_tag(:label, radio_button_tag(field["datapoint"], false) + "False".html_safe, :class=>"radio",)
				end
			when "Dropdown"
				return select_tag(field["datapoint"], options_for_select(field["defaults"].split(",")))
			when "Long"
				return text_area_tag(field["datapoint"], nil, :size => "400x8", :style=>"width:461px;")
		end
	end
end
