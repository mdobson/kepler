class DataExplorerController < ApplicationController
  def index
  	@form = Form.get_forms_by_study_id(params[:study_id]).first
  end

end
