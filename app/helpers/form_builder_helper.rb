module FormBuilderHelper
	
	def uri
		return "http://[URL_HERE].com/"
	end


	def access_form_api(json_form_data, study_id, method_symbol)

		json_form_object = deserialize_json(json_form_data)

		json_form_object_graph = serialize_json(json_form_object, study_id)
		
		self.method(method_symbol).call(json_form_object_graph)
	end

	def deserialize_json(json_string)
		form_object = ActiveSupport::JSON.decode(json_string)
		return form_object
	end

	def serialize_json(json_object, study_id)
		form_object_graph = ActiveSupport::JSON.encode({:data => json_form_object, :study_id => study_id})
		return form_object_graph
	end

	def create_form(object_graph)
		#create form
	end

	def edit_form(object_graph)
		#edit form
	end

	def delete_form(object_graph)
		#delete form
	end

	def perform_request(uri, object_graph)
		#perform actual request
	end
end
