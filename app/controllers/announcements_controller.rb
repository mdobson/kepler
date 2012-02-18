class AnnouncementsController < ApplicationController
  def index
        @announcements = Announcements.posts_by_study(params[:study_id])
        respond_to do |format|
          format.html
          format.json { render json: @announcements }
        end
  end
  
  def new
      @post = Announcements.new
      @study = Study.find(params[:study_id])
      respond_to do |format|
        format.html
      end
  end

  def create
    @post = Announcements.new(params[:announcements])
    @post.user_id = current_user.id
    @post.study_id = params[:study_id]
    respond_to do |format|
      if @post.save
        format.html { redirect_to "/studies/#{@post.study_id}/announcements/#{@post.id}", notice: 'Announcement was successfully created.' }
      end
    end
  end

  def show
      @post = Announcements.post_by_study_and_id(params[:study_id], params[:id]).first
      respond_to do |format|
        format.html
        format.json { render json: @post }
      end
  end

end
