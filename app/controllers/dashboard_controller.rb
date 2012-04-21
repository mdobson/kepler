class DashboardController < ApplicationController
  layout 'with_links'
  def index
  	@study = Study.find(params[:study_id])
    @users_in_study = AccessControl.all_users_in_study(params[:study_id])
    @posts = Announcements.posts_by_study(params[:study_id])
    @subjects = ExampleSubject.retrieve_by_study(params[:study_id])
  end

end
