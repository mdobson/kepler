class SubjectsController < ApplicationController
  layout "with_links"
  respond_to :json

  def index
  	@forms = Form.get_forms_by_study_id(params[:study_id])
    subject_ids = []
    @forms.each do |form|
      subject_meta_id = form.fields.subject_id_in_form(form.id).first
      if subject_meta_id != nil
        form.data_sets.each do |data_set|
          subject_ids.push(data_set.data_set[subject_meta_id.datapoint])
        end
      end
      
    end
    @unique_forms = subject_ids.uniq.compact
    logger.debug "Subject ids #{@unique_forms}"
  end

  def show
    @forms = Form.get_forms_by_study_id(params[:study_id])
    data_sets = []
    @forms.each do |form|
      subject_meta_id = form.fields.subject_id_in_form(form.id).first
      if subject_meta_id != nil
        form.data_sets.each do |data_set|
          if data_set.data_set[subject_meta_id.datapoint] == params[:id]
            data_sets.push(data_set)
          end
        end
      end
    end
    @data_sets = data_sets
  	# @form = Form.find(params[:id])
  	# respond_to do |format|
   #    format.html{ render :layout => "with_links" }
   #    format.json{ render :json => generate_feed(@form).to_json }
   #  end
  end

  def generate_feed(form)
  	array_of_data = []
  	form.data_sets.each do |data_set|
  		data_collection = {}
  		form.fields.order("position").each do |field|
  			data_collection[field.question] = data_set.data_set[field.datapoint]
  		end
  		array_of_data.push(data_collection)
  	end
  	return array_of_data
  end
end
