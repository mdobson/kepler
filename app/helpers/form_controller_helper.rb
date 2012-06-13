module FormControllerHelper
	def convert_form_data_type(field)
		case field["datatype"]
			when "Text"
				return text_field_tag(field["datapoint"])
			when "Numeric"
				return text_field_tag(field["datapoint"])
			when "Bool"
				return content_tag :div, :class=>"controls" do 
					content_tag(:label, radio_button_tag(field["datapoint"], true) + "True".html_safe, :class=>"radio") +
					content_tag(:label, radio_button_tag(field["datapoint"], false) + "False".html_safe, :class=>"radio")
				end
			when "Dropdown"
				return select_tag(field["datapoint"], options_for_select(field["defaults"].split(",")))
			when "Long"
				return text_area_tag(field["datapoint"], nil, :size => "400x8", :style=>"width:461px;")
			when "Scale"
				return content_tag :div, :class => "control-group" do
					content_tag :div, :class => "controls" do
						content_tag(:label, radio_button_tag(field["datapoint"], 1) + "1".html_safe, :class=>"checkbox inline")+
						content_tag(:label, radio_button_tag(field["datapoint"], 2) + "2".html_safe, :class=>"checkbox inline")+
						content_tag(:label, radio_button_tag(field["datapoint"], 3) + "3".html_safe, :class=>"checkbox inline")+
						content_tag(:label, radio_button_tag(field["datapoint"], 4) + "4".html_safe, :class=>"checkbox inline")+
						content_tag(:label, radio_button_tag(field["datapoint"], 5) + "5".html_safe, :class=>"checkbox inline")
					end
				end
		end
	end

	def create_embed_tag(vimeo_url)
		return "<iframe src='#{vimeo_url}' width=500 height=281 frameborder=0></iframe>".html_safe
	end

	def convert_to_string(data)
		if data == "true" 
			return 1
		end

		if data == "false"
			return 0
		end

		return data
	end
end
