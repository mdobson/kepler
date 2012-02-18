class AccessControlsController < ApplicationController
  def index
  end

  def new
    @acl = AccessControl.new
    @study = Study.find(params[:study_id])
    respond_to do |format|
      format.html
    end
  end

  def edit
  end

  def delete
  end

  def create
  end

end
