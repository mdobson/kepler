class DashboardController < ApplicationController
  layout 'with_links'
  
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
  	@study = Study.find(params[:study_id])
    @data_sets = DataSet.get_ordered_forms_by_study_id(params[:study_id])
    choose_layout(current_user.id, params[:study_id])
  end

  def choose_layout(user_id, study_id)
    acl = AccessControl.for_user_in_study(user_id, study_id).first
    if acl.is_admin
      render "admin"
    else
      render "profile"
    end
  end

end
