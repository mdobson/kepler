class Field < ActiveRecord::Base
	belongs_to :form

	def self.create_field(form_id, json_array)
		field = Field.new
		field.form_id = form_id
		field.position = json_array["pos"]
		field.metadata = json_array
		field.save
	end


	#expoermental hstore metaprogramming
	%w[pos datatype question datapoint canblank helptext defaults].each do |key|

		scope "has_#{key}", lambda { |value| where("metadata @> (? => ?)", key, value) }

		define_method(key) do
      		metadata && metadata[key]
    	end
  
    	define_method("#{key}=") do |value|
      		self.metadata = (metadata || {}).merge(key => value)
    	end

	end

end
