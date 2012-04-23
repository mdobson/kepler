class FormBuilderController < ApplicationController
  layout 'with_links'
  respond_to :json

  def index
  end

  def create
    response = params[:data]
  	render :json => response
  end

  def new
    @form = Form.new
  end

end
