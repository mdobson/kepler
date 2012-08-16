class RecordController < ApplicationController
  layout 'with_links'

  def show
  	@record = DataSet.find(params[:id])
  end

  def edit
  	@dataSet = DataSet.find(params[:id])
  	@form = @dataSet.form
  	@path = study_record_path
  end

  def update
  	DataSet.update_data_entered(params[:set_id], params[:form_id], params)
  	redirect_to study_subject_path(params[:study_id], params[:form_id])
  end

  def print
  	@dataSet = DataSet.find(params[:id])
  	@form = @dataSet.form
  	@path = study_record_path
  	respond_to do |format|
      format.html {render :layout => "printout"}
      format.pdf { doc_raptor_send }
    end
  end

  #TODO get rid of the copy pasta and send this to a library.
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

end
