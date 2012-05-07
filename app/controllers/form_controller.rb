require 'uuidtools'

class FormController < ApplicationController
  
  layout 'with_links'

  before_filter :authenticate_user!, :except => [:public, :public_create]

  def index
  	@forms = Form.get_forms_by_study_id(params[:study_id])
  end

  def show
    @form = Form.get_form_by_form_id(params[:id]).first
    if @form.is_mobile == true
      layout = "mobile_partials"
    else
      layout = "with_links"
    end

    respond_to do |format|
      format.html{ render :layout => layout }
    end
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

  def update
    @form = Form.get_form_by_form_id(params[:id]).first
    if params[:parameter] == "publish"
      @form.is_published = params[:publish]
    else
      @form.is_mobile = params[:mobile]
    end
    @form.save

    respond_to do |format|
      format.html { redirect_to study_dashboard_index_url }
    end
  end

  def public_create
    logger.debug params
    @form = Form.get_form_by_form_id(params[:id]).first
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
    redirect_to public_study_form_path
  end

  def public
    @form = Form.get_form_by_form_id(params[:id]).first
    respond_to do |format|
      format.html{ render :layout => "application" }
    end
  end

end
