require "net/http"

class ApiObject
	
	def self.uri
		return config.api_uri
	end

	def self.deserialize_json(json_string)
		form_object = ActiveSupport::JSON.decode(json_string)
		return form_object
	end

	def self.serialize_json(json_object, study_id)
		form_object_graph = ActiveSupport::JSON.encode({:data => json_object, :study_id => study_id})
		return form_object_graph
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

end