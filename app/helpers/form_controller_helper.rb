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
				##TODO Validate this form type when we do not have data in this.
				return select_tag(field["datapoint"], options_for_select(field["defaults"].split(",")))
			when "Long"
				return text_area_tag(field["datapoint"], nil, :size => "400x8", :style=>"width:461px;")
			when "Scale"
				thead = content_tag :thead do
					content_tag :tr do
						content_tag(:th, "1".html_safe)+
						content_tag(:th, "".html_safe)+
						content_tag(:th, "".html_safe)+
						content_tag(:th, "".html_safe)+
						content_tag(:th, "5".html_safe)
					end
				end

				tbody = content_tag :tbody do
					content_tag :tr, :class => "" do
						content_tag(:td, radio_button_tag(field["datapoint"], 1))+
						content_tag(:td, radio_button_tag(field["datapoint"], 2))+
						content_tag(:td, radio_button_tag(field["datapoint"], 3))+
						content_tag(:td, radio_button_tag(field["datapoint"], 4))+
						content_tag(:td, radio_button_tag(field["datapoint"], 5))
					end
				end

				return content_tag :table, :class => "table table-bordered table-striped" do
					thead + tbody
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
