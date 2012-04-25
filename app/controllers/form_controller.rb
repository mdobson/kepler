require 'uuidtools'

class FormController < ApplicationController
  def index
  	@forms = Form.all(params[:study_id])
  end

  def show
  end

  def create
  	logger.debug params
  	@form = Form.get_form_by_form_id(params[:form_id]).first
    uuid = UUIDTools::UUID.random_create().to_s
  	@form.fields.each do |field|
  		datum = Datum.new
  		datum.study_id = params[:study_id]
  		datum.form_id = params[:form_id]
  		datum.field_id = field.id
  		datum.data_point = params[field.field_name].to_s
      datum.uuid = uuid
  		datum.save
  	end
  	redirect_to study_form_index_path
  end

end
