class FormController < ApplicationController
  def index
  	 @forms = Form.get_forms_by_study_id(params[:study_id])
  end

end
