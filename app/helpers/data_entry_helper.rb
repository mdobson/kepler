require 'json'

module DataEntryHelper
	def get_data_column(fields)
		array_of_fields = []
		fields.each do |field|	
			hash = {:id=>field.field_name,:name=>field.field_name,:field=>field.field_name}
			array_of_fields.push(hash)
		end
		return array_of_fields.to_json
	end
end
