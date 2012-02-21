class DashboardController < ApplicationController
  layout 'with_links'
  def index
    @users_in_study = AccessControl.all_users_in_study(params[:study_id])
    @posts = Announcements.posts_by_study(params[:study_id])
  end

end
