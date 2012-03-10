class FormBuilderController < ApplicationController
  layout 'with_links'

  respond_to :json

  def index
  end

  def create
  	render :json => params[:data]
  end

  def new
  end

end
