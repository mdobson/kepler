module SubjectsHelper
def convert_form_data_type_with_value(field, value)
		case field["datatype"]
			when "Text"
				return text_field_tag(field["datapoint"], value)
			when "Numeric"
				return text_field_tag(field["datapoint"], value)
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
				if field["numberscale"] == "10"
					return create_ten_scale(field)
				else
					return create_five_scale(field)
				end
		end
	end

	def convert_subject_id_field(field, value)
		subject_id_field = Field.subject_id_in_form(field.form.required_form_id).first
		required_form_datasets = Form.find(field.form.required_form_id).data_sets
		subject_ids = required_form_datasets.collect{|dataset| dataset.data_set[subject_id_field.metadata["datapoint"]]}
		logger.debug "SUBJECT IDs #{subject_ids} selected #{value}"
		padding = [" "]
		return select_tag(field.metadata["datapoint"], options_for_select(padding + subject_ids, value))
	end

	def create_five_scale(field)
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

	def create_ten_scale(field)
		thead = content_tag :thead do
			content_tag :tr do
				content_tag(:th, "1".html_safe)+
				content_tag(:th, "".html_safe)+
				content_tag(:th, "".html_safe)+
				content_tag(:th, "".html_safe)+
				content_tag(:th, "".html_safe)+
				content_tag(:th, "".html_safe)+
				content_tag(:th, "".html_safe)+
				content_tag(:th, "".html_safe)+
				content_tag(:th, "".html_safe)+
				content_tag(:th, "10".html_safe)
			end
		end

		tbody = content_tag :tbody do
			content_tag :tr, :class => "" do
				content_tag(:td, radio_button_tag(field["datapoint"], 1))+
				content_tag(:td, radio_button_tag(field["datapoint"], 2))+
				content_tag(:td, radio_button_tag(field["datapoint"], 3))+
				content_tag(:td, radio_button_tag(field["datapoint"], 4))+
				content_tag(:td, radio_button_tag(field["datapoint"], 5))+
				content_tag(:td, radio_button_tag(field["datapoint"], 6))+
				content_tag(:td, radio_button_tag(field["datapoint"], 7))+
				content_tag(:td, radio_button_tag(field["datapoint"], 8))+
				content_tag(:td, radio_button_tag(field["datapoint"], 9))+
				content_tag(:td, radio_button_tag(field["datapoint"], 10))
			end
		end

		return content_tag :table, :class => "table table-bordered table-striped" do
			thead + tbody
		end
	end
end
