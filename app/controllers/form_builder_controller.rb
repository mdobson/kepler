class FormBuilderController < ApplicationController
  layout 'with_links'
  respond_to :json

  def index
    if(params.has_key?(:id))
      @form = Form.get_form_by_form_id(params[:id]).first
      fields = @form.fields
      responseStruct = {}
      responseStruct["name"] = @form.name
      responseStruct["fields"] = fields.to_json
      #logger.debug responseStruct
      render :json => responseStruct
    end
  end

  def create
    
    response = params[:form_builder]
    @form = Form.new
    @form.name = params[:name]
    @form.study_id = params[:study_id]
    @form.user_id = current_user.id

    if @form.save
      params[:fields].each do |field|
        Field.create_field(@form.id, field)
      end
    end
    render :json => response
  end

  def new
  end

end