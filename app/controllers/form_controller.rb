class FormController < ApplicationController
  
  layout 'with_links', :except => [:print, :print_all]

  skip_before_filter :authenticate_user!, :only => [:public, :public_create, :embed, :public_thanks, :thanks]

  skip_before_filter :authorize_user, :only => [:public, :public_create, :embed, :public_thanks, :thanks]

  respond_to :json

  def index
  	@forms = Form.get_forms_by_study_id(params[:study_id])
  end

  def show
    @invalid_fields = []
    @form = Form.get_form_by_form_id(params[:id]).first
    @path = study_form_index_path
    layout = retrieve_template_name("mobile_partials", "with_links", @form)
    respond_to do |format|
      format.html{ render :layout => layout }
      #format.json{ render :json => { :form => @form.to_json, :fields => @form.fields.to_json } }
      format.json{render :json=>@form.to_json}
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
    @invalid_fields = DataSet.create_data_set(@form, params[:study_id], params)
    if @invalid_fields.length == 0 
      redirect_to public_thanks_study_form_path(@form)
    else
      respond_to do |format|
          format.html { redirect_to public_study_form_path(@form), notice: "There were errors in your form please fill out all required fields!" }        
      end
    end
  end

  def embed_create
    @form = Form.get_form_by_form_id(params[:id]).first
    DataSet.create_data_set(@form, params[:study_id], params)
  end

  def public
    @form = Form.get_form_by_form_id(params[:id]).first
    @path = public_create_study_form_path
    @invalid_fields = []
    layout = retrieve_template_name("mobile_partials", "application", @form)
    respond_to do |format|
      format.html{ render :layout => layout }
      format.json{ render :json => @form.fields.order("position").to_json }
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

  def print
    @form = Form.get_form_by_form_id(params[:id]).first
    respond_to do |format|
      format.html {render :layout => "printout"}
      format.pdf { doc_raptor_send }
    end
  end

  def printall
    @form = Form.get_form_by_form_id(params[:id]).first
    respond_to do |format|
      format.html{ render :layout => "printout" }
      format.xls { doc_raptor_send }
    end
  end

  def doc_raptor_send(options = {})
    default_options ={
      :name => controller_name,
      :document_type => request.format.to_sym
    }

    options = default_options.merge(options)
    options[:document_content] ||= render_to_string
    ext = options[:document_type].to_sym
    
    response = DocRaptor.create(options)
    if response.code == 200
      send_data response, :filename => "#{options[:name]}.#{ext}", :type => ext
    else
      render :inline => response.body, :status => response.code
    end
  end


  def retrieve_template_name(mobile_template, browser_template, form)
    if form.is_user_agent_mobile(request)
      @isMobile = true
      layout = mobile_template
    else
      @isMobile = false
      layout = browser_template
    end
    return layout
  end

end
