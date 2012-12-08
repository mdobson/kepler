class FormBuilderController < ApplicationController
  layout 'with_links'
  respond_to :json

  before_filter :authorize_dashboard

  def authorize_dashboard
    if params.has_key?(:study_id)
      acl = AccessControl.for_user_in_study(current_user.id, params[:study_id]).first
      if acl.is_admin == false
        respond_to do |format|
          format.html { redirect_to study_form_index_path, notice: "Welcome. These are the forms for #{acl.study_title}" }        
        end
      end
    end
  end

  def index
    if(params.has_key?(:id))
      responseStruct = Form.to_json(params)
      render :json => responseStruct
    end
  end

  def create
    if(!params.has_key?(:formid))
      flag = Form.create_new_form(params, current_user.id)
      render :json => flag.to_json
    else
      flag = Form.update_old_form(params)
      render :json => flag.to_json
    end
  end

  def names
    @selected_id = params[:selected_id]

    @form_names_and_ids = Form.get_forms_by_study_id(params[:study_id]).collect{|form| [ form.name, form.id]}

    respond_to do |format|
      format.html{ render :layout => false}
    end
  end




  def update

  end

  def new
  end

end