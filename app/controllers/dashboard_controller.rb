class DashboardController < ApplicationController
  layout 'with_links'
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
