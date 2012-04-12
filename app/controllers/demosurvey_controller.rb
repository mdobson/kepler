class DemosurveyController < ApplicationController
  
  #this is for devise to say we don't want to authenticate on these routes!
  before_filter :authenticate_user!, :except => [:new, :create, :thankyou]

  def index
  end

  def new
  	@study = Study.find(params[:study_id])
  	@demo = Demosurvey.new
  end

  def create
  	@demo = Demosurvey.new(params[:example_subject])
  	respond_to do |format|
      if @demo.save
        format.html {redirect_to thankyou_study_demosurvey_index_path, notice: "Thank you for taking our sruvey!"}
      end
    end
  end

  def thankyou
  end

end
