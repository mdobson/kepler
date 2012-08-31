require 'uuidtools'

class DataSet < ActiveRecord::Base
	belongs_to :form
	belongs_to :study

	scope :get_data_sets_by_study_id, lambda{|study_id|
		where("study_id = ?", study_id)
	}

	scope :get_last_entered_date, lambda{|form_id|
		where("form_id = ?", form_id).order("updated_at ASC").first
	}

	scope :get_ordered_forms_by_study_id, lambda{|study_id|
		select("form_id, count(*) as rec_count").where("study_id = ?", study_id).group("form_id")
	}

	delegate :name, :to => :form, :prefix => true

	def self.create_data_set(form, study_id, params)
		uuid = UUIDTools::UUID.random_create().to_s
    	data_hash = {}
    	invalid_fields = []
    	hstore_data_set = DataSet.new
  		form.fields.each do |field|
  			if field.metadata["canblank"] == "True"
  				if params[field.metadata["datapoint"]].empty?
  					invalid_fields.push(field.metadata["datapoint"])
  				else
  					data_hash[field.metadata["datapoint"]] = params[field.metadata["datapoint"]]
  				end
  			else
  				data_hash[field.metadata["datapoint"]] = params[field.metadata["datapoint"]]
  			end
  		end
  		hstore_data_set.uuid = uuid
    	hstore_data_set.form_id = form.id
    	hstore_data_set.study_id = study_id
    	hstore_data_set.data_set = data_hash
    	if invalid_fields.length == 0
    		hstore_data_set.save
    	end
    	return invalid_fields
	end

	def self.update_data_entered(data_set_id, form_id, params)
		data_set = DataSet.find(data_set_id)
		form = Form.find(form_id)
		data_hash = {}
		form.fields.each do |field|
  			data_hash[field.metadata["datapoint"]] = params[field.metadata["datapoint"]]
  		end
  		data_set.data_set = data_hash
  		data_set.save
	end
end
