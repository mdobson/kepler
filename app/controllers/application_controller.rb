class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  
  protected
  
  def stored_location_for(arg)
    nil
  end
  
  
  def after_sign_in_path_for(resource_or_scope)
    acl = AccessControl.user_studies(current_user.id)
    if acl.count == 0
       :root
    else
       "/studies/#{acl.first.study_id}/announcements" 
    end
  end
  
end
