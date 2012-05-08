class DashboardController < ApplicationController
  layout 'with_links'
  def index
  	@study = Study.find(params[:study_id])
    @users_in_study = AccessControl.all_users_in_study(params[:study_id])
    @posts = Announcements.posts_by_study(params[:study_id])
    @forms = Form.get_forms_by_study_id(params[:study_id])
  	acl = AccessControl.for_user_in_study(current_user.id, params[:study_id]).first
  	if acl.is_admin
  		render "admin"
  	else
  		render "profile"
  	end
  end

end
