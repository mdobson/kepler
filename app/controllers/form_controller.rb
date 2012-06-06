class FormController < ApplicationController
  
  layout 'with_links'

  before_filter :authenticate_user!, :except => [:public, :public_create, :embed]

  def index
  	@forms = Form.get_forms_by_study_id(params[:study_id])
  end

  def show
    @form = Form.get_form_by_form_id(params[:id]).first
    @path = study_form_index_path
    layout = retrieve_template_name("mobile_partials", "with_links", @form)
    logger.debug @form
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
    Form.update_publish_status(@form, params[:parameter], params[:publish])
    respond_to do |format|
      format.html { redirect_to study_dashboard_index_url }
    end
  end

  def public_create
    @form = Form.get_form_by_form_id(params[:id]).first
    DataSet.create_data_set(@form, params[:study_id], params)
    redirect_to public_thanks_study_form_path(@form)
  end

  def embed_create
    @form = Form.get_form_by_form_id(params[:id]).first
    DataSet.create_data_set(@form, params[:study_id], params)
    redirect_to thanks_study_form_path(@form)
  end

  def public
    @form = Form.get_form_by_form_id(params[:id]).first
    @path = public_create_study_form_path
    layout = retrieve_template_name("mobile_partials", "application", @form)
    respond_to do |format|
      format.html{ render :layout => layout }
    end
  end

  def invite
      @published_forms = Form.get_published_forms_for_study(params[:study_id])
      if(params.has_key?(:contacts))
        contacts = params[:contacts].split(" ")
        all_contacts = []
        contacts.each do |contact|
          all_contacts = all_contacts | contact.split(",")
        end
        all_contacts.each do |contact_email|
          #logger.debug contact_email
          #logger.debug public_study_form_path(params[:study_id], params[:published_forms])
          Notification.invite(public_study_form_url(params[:study_id], params[:published_forms]), contact_email).deliver
        end
      end
  end

  def embed
    @form = Form.get_form_by_form_id(params[:id]).first
    @path = embed_create_study_form_path
    respond_to do |format|
      format.html{ render :layout => "embed" }
    end
  end

  def public_thanks
    @form = Form.get_form_by_form_id(params[:id]).first
    layout = retrieve_template_name("mobile_partials", "application", @form)
    respond_to do |format|
      format.html{ render :layout => layout }
    end
  end

  def thanks
    @form = Form.get_form_by_form_id(params[:id]).first
    respond_to do |format|
      format.html{ render :layout => "embed" }
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
