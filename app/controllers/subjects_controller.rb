class SubjectsController < ApplicationController
  layout "with_links"

  def index
  	@forms = Form.get_forms_by_study_id(params[:study_id])
  end

  def show
  	@form = Form.find(params[:id])
  end

end
