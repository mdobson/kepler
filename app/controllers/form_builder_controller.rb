class FormBuilderController < ApplicationController
  layout 'with_links'
  respond_to :json

  def index
  end

  def create
  	response = params[:data]
    @form = Form.new
    @form.name = params[:name]
    @form.study_id = params[:study_id]
    @form.user_id = current_user.id
    parsed_json = ActiveSupport::JSON.decode(response)
    meta_data_hash = {}
    parsed_json.each do |field|
      meta_data_hash[field["name"]] = field
    end
    @form.meta_data = meta_data_hash
    @form.save
    render :json => response
  end

  def new
  end

end
