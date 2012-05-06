require 'uuidtools'

class FormController < ApplicationController
  layout 'with_links'
  def index
  	@forms = Form.get_forms_by_study_id(params[:study_id])
  end

  def show
    @form = Form.get_form_by_form_id(params[:id]).first
  end

  def create
  	logger.debug params
  	@form = Form.get_form_by_form_id(params[:form_id]).first
    uuid = UUIDTools::UUID.random_create().to_s
    data_hash = {}
    @hstore_data_set = DataSet.new
  	@form.fields.each do |field|
  		data_hash[field.metadata["datapoint"]] = params[field.metadata["datapoint"]]
  	end
    @hstore_data_set.uuid = uuid
    @hstore_data_set.form_id = @form.id
    @hstore_data_set.study_id = params[:study_id]
    @hstore_data_set.data_set = data_hash
    @hstore_data_set.save
  	redirect_to study_form_index_path
  end

end
