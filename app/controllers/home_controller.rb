class HomeController < ApplicationController
  layout 'logout'
  def index
  	redirect_to profile_index_path
  end

end
