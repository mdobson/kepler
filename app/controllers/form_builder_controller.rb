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

    if @form.save
      parsed_json = ActiveSupport::JSON.decode(response)
      parsed_json.each do |field|
        Field.create_field(@form.id, field)
      end
    end
    render :json => response
  end

  def new
  end

end
