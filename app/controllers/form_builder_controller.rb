class FormBuilderController < ApplicationController
  layout 'with_links'

  respond_to :json

  def index
  	@forms = Form.all(params[:study_id])
  end

  def create
  	@form = Form.new
  	response = Form.create(params[:data], params[:study_id])
  	render :json => response
  end

  def new
  end

end
