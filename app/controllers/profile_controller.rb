class ProfileController < ApplicationController
  layout 'profile_links'

  def index
  	@acls = AccessControl.user_studies(current_user.id)
  end

end
