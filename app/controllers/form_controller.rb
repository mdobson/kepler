class FormController < ApplicationController
  def index
  	@forms = Form.all(params[:study_id])
  end

  def show
  end

end
