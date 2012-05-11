class FormController < ApplicationController
  
  layout 'with_links'

  before_filter :authenticate_user!, :except => [:public, :public_create]

  def index
  	@forms = Form.get_forms_by_study_id(params[:study_id])
  end

  def show
    @form = Form.get_form_by_form_id(params[:id]).first
    layout = retrieve_template_name("mobile_partials", "with_links", @form)
    respond_to do |format|
      format.html{ render :layout => layout }
    end
  end

  def create
  	@form = Form.get_form_by_form_id(params[:form_id]).first
    DataSet.create_data_set(@form, params[:study_id], params)
  	redirect_to study_form_index_path
  end

  def update
    @form = Form.get_form_by_form_id(params[:id]).first
    Form.update_form(@form, params[:parameter], params[:publish])
    respond_to do |format|
      format.html { redirect_to study_dashboard_index_url }
    end
  end

  def public_create
    @form = Form.get_form_by_form_id(params[:id]).first
    DataSet.create_data_set(@form, params[:study_id], params)
    redirect_to public_study_form_path(@form)
  end

  def public
    @form = Form.get_form_by_form_id(params[:id]).first
    layout = retrieve_template_name("mobile_partials", "application", @form)
    respond_to do |format|
      format.html{ render :layout => layout }
    end
  end

  private 

  def retrieve_template_name(mobile_template, browser_template, form)
    if form.is_user_agent_mobile(request)
      layout = mobile_template
    else
      layout = browser_template
    end
    return layout
  end

end
