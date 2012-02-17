class StudiesController < ApplicationController
  def new
    @study = Study.new
    respond_to do |format|
      format.html
    end
  end

  def show
    @study = Study.find(params[:id])
    @acl = AccessControl.for_user_in_study(current_user.id, @study.id).first
  end

  def create
      @study = Study.new(params[:study])
      @study.user_id = current_user.id
      respond_to do |format|
        if @study.save
          format.html { redirect_to "/studies/#{@study.id}/", notice: 'Study was successfully created.' }
        end
      end
  end

  def edit
  end

  def delete
  end

end
