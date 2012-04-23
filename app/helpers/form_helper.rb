module FormHelper
	def get_form_field(field_obj)
		case field_obj["datatype"]
		when "Number"
			return text_field_tag(:q)
		when "Text"
			return text_field_tag(:q)
		else
			return text_field_tag(:q) 
		end
	end
end
