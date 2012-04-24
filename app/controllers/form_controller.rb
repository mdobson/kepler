class FormController < ApplicationController
  layout 'with_links'

  def index
  	 @forms = Form.get_forms_by_study_id(params[:study_id])
  end

  def create
  	logger.debug params
  	redirect_to study_form_index_path
  end

end
