class Field < ActiveRecord::Base
	belongs_to :form

	def self.create_field(form_id, json_array)
		json_array["datapoint"] = rand(36**8).to_s(36)
		field = Field.new
		field.form_id = form_id
		field.position = json_array["pos"]
		json_array.each do |key, value|
			if value.blank?
				json_array.delete(key)
			end
		end
		field.metadata = json_array
		field.save
	end

	scope :first_datapoint_in_form, lambda {|form_id| where("position = 1 and form_id = ?", form_id)}

	#experimental hstore metaprogramming
	%w[pos datatype question datapoint canblank helptext defaults video numberscale].each do |key|

		scope "has_#{key}", lambda { |value| where("metadata @> (? => ?)", key, value) }

		define_method(key) do
      		metadata && metadata[key]
    	end
  
    	define_method("#{key}=") do |value|
      		self.metadata = (metadata || {}).merge(key => value)
    	end

	end

end
