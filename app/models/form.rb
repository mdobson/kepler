require "net/http"

class Form
	def self.save
	end

	def self.all(study_id)
		res = self.get_all_forms(study_id)
		#return res
		return self.deserialize_json(res)
	end

	def self.uri
		return "http://0.0.0.0:2999/"
	end


	def self.access_form_api(json_form_data, study_id, method_symbol)

		json_form_object = self.deserialize_json(json_form_data)

		json_form_object_graph = self.serialize_json(json_form_object, study_id)

		res = self.method(method_symbol).call(json_form_object_graph)

		return res
	end

	def self.deserialize_json(json_string)
		form_object = ActiveSupport::JSON.decode(json_string)
		return form_object
	end

	def self.serialize_json(json_object, study_id)
		form_object_graph = ActiveSupport::JSON.encode({:data => json_object, :study_id => study_id})
		return form_object_graph
	end

	def self.create_form(object_graph)
		request_uri = URI("#{self.uri}")
		res = self.perform_post_request(request_uri, object_graph)
		return res
	end

	def self.get_all_forms(study_id)
		request_uri = URI("#{self.uri}#{study_id}")
		res = self.perform_get_request(request_uri)
		return res
	end

	def self.edit_form(object_graph)
		#edit form
	end

	def self.delete_form(object_graph)
		#delete form
	end

	def self.perform_get_request(uri)
		begin
			res = Net::HTTP.get(uri)
			return res
		rescue
			return ActiveSupport::JSON.encode({:error => "API Failure", :uri => uri})
		end 
	end

	def self.perform_post_request(uri, object_graph)
		#perform actual request
		begin
			res = Net::HTTP.post_form(uri, "data" => object_graph)
			return res.body
		rescue
			return ActiveSupport::JSON.encode({:error => "API Failure", :uri => uri})
		end
	end

	def self.create(params, study_id)
		res = self.access_form_api(params, study_id, :create_form)
		return res
	end
end