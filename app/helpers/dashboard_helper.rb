module DashboardHelper

	def generate_form_builder_link(form_id)
		return "#{study_form_builder_index_path}##{form_id}"
	end

end
