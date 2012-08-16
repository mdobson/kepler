class SubjectsController < ApplicationController
  layout "with_links"
  respond_to :json

  def index
  	@forms = Form.get_forms_by_study_id(params[:study_id])
  end

  def show
  	@form = Form.find(params[:id])
  	respond_to do |format|
      format.html{ render :layout => "with_links" }
      format.json{ render :json => generate_feed(@form).to_json }
    end
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
