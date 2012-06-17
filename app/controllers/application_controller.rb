class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  #before_filter :authorize_user
  
  helper_method :get_user_acls
  helper_method :get_user_forms
  helper_method :get_root_url

  def get_user_acls
   return AccessControl.user_studies(current_user.id)
  end

  def get_user_forms
    return Form.get_forms_by_study_id(params[:study_id])
  end

  def get_root_url
    if params.has_key?(:study_id)
      return study_dashboard_index_path
    else
      return root_path
    end
  end

  def authorize_user
    if params.has_key?(:study_id)
      acl = AccessControl.for_user_in_study(current_user.id, params[:study_id]).first
      if acl == nil
        respond_to do |format|
          format.html { redirect_to root_path, notice: "Sorry you don't have permissions to this study" }        
        end
      end
    end
  end

  protected
  
  def stored_location_for(arg)
    nil
  end
  
  
  def after_sign_in_path_for(resource_or_scope)
    acl = AccessControl.user_studies(current_user.id)
    if acl.count == 0
       :root
    else
       "/studies/#{acl.first.study_id}/dashboard" 
    end
  end
  
end
