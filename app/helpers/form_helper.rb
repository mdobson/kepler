module FormHelper
	def publish_forms_dropdown_tag(published_forms)
		dropdown_contents = []
		published_forms.each do |published_form|
			form_info = [published_form.name, published_form.id]
			dropdown_contents.push(form_info)	
		end
		return select_tag("published_forms", options_for_select(dropdown_contents))
	end
end
