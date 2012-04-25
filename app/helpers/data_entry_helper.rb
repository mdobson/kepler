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

	def get_data(uuids)
		array_of_data = []
		uuids.each do |uuid|
			data = Datum.get_data_by_uuid(uuid.uuid)
			data_hash = Hash.new
			data.each do |datum|
				data_hash[datum.field.field_name] = datum.data_point
			end
			array_of_data.push(data_hash)
		end
		return array_of_data.to_json
	end
end
