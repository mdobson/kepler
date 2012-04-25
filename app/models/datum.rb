class Datum < ActiveRecord::Base
	belongs_to :study
	belongs_to :form
	belongs_to :field 

	scope :get_data_by_uuid, lambda{|uuid|
		where("uuid = ?", uuid)
	}
end
