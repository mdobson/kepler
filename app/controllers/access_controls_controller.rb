class AccessControlsController < ApplicationController
  def index
  end

  def show
    @acl = AccessControl.find(params[:id])
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
    userEmail = params[:access_control][:user_id]
    userId = User.get_user_id_from_email(userEmail).first.id
    @acl = createAcl(userId, params)
    respond_to do |format|
      if @acl.save
        format.html { redirect_to "/studies/#{params[:study_id]}/access_controls/#{@acl.id}", notice: 'Access Control was successfully created.'}
      end
    end
  end
  
  def createAcl(userId, params)
    acl = AccessControl.new
    acl.user_id = userId
    acl.study_id = params[:study_id]
    acl.is_admin = params[:access_control][:is_admin]
    acl.can_read = params[:access_control][:can_read]
    acl.can_write = params[:access_control][:can_write]
    return acl
  end

end
