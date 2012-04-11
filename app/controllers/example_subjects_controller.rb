class ExampleSubjectsController < ApplicationController


  layout "with_links", :except => [:print]
  
  respond_to :json, :html

  def index
    @study = Study.find(params[:study_id])
    @subjs = ExampleSubject.where("study_id = ?", params[:study_id])
    respond_with @subjs
  end

  def show

  end

  def new
    @study = Study.find(params[:study_id])
    @subj = ExampleSubject.new
  end

  def create
    @subj = ExampleSubject.new(params[:example_subject])
    @subj.user_id = current_user.id
    @subj.study_id = params[:study_id]
    respond_to do |format|
      if @subj.save
        format.html {redirect_to "/studies/#{params[:study_id]}/example_subjects", notice: "Example subject successfully created."}
      end
    end
  end

  def edit
    @study = Study.find(params[:study_id])
    @subj = ExampleSubject.retrieve_by_study_and_identifier(params[:study_id], params[:id]).first
  end

  def destroy
    @subj = ExampleSubject.retrieve_by_study_and_identifier(params[:study_id], params[:id]).first
    @subj.destroy

    respond_to do |format|
      format.html { redirect_to study_example_subjects_url }
    end
  end

  def update
    @subj = ExampleSubject.retrieve_by_study_and_identifier(params[:study_id], params[:id]).first
    respond_to do |format|
      if @subj.update_attributes(params[:example_subject])
        format.html { redirect_to "/studies/#{params[:study_id]}/example_subjects", notice: 'Subject was successfully updated.' }
        
      else
        format.html { render action: "edit" }
       
      end
    end
  end

  def print
    @study = Study.find(params[:study_id])
    if(params.has_key?(:id))
      @subj = ExampleSubject.retrieve_by_study_and_identifier(params[:study_id], params[:id]).first
      @header = "Example Subject #{params[:id]}"
    else
      @subj = ExampleSubject.new
      @header = "Example Subject Form"
    end

    respond_to do |format|
      format.html {render :layout => "printout"}
      format.pdf {doc_raptor_send}
    end
  end

  def doc_raptor_send(options = {})
    default_options ={
      :name => controller_name,
      :document_type => request.format.to_sym,
      :test => true
    }

    options = default_options.merge(options)
    options[:document_content] ||= render_to_string
    ext = options[:document_type].to_sym
    
    response = DocRaptor.create(options)
    if response.code == 200
      send_data response, :filename => "#{options[:name]}.#{ext}", :type => ext
    else
      render :inline => response.body, :status => response.code
    end
  end

  def printall
    @subjects = ExampleSubject.where("study_id = ?", params[:study_id])
    respond_to do |format|
      format.xls {doc_raptor_send}
    end
  end
end
