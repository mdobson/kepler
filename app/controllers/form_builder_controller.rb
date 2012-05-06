class FormBuilderController < ApplicationController
  layout 'with_links'
  respond_to :json

  def index
    if(params.has_key?(:id))
      @form = Form.get_form_by_form_id(params[:id]).first
      fields = @form.fields
      responseFields = []
      fields.each do |field_data|
        responseFields.push(field_data.metadata)
      end
      responseStruct = {}
      responseStruct["name"] = @form.name
      responseStruct["fields"] = responseFields.to_json
      #logger.debug responseStruct
      render :json => responseStruct
    end
  end

  def create
    if(!params.has_key?(:formid))
      response = params[:form_builder]
      @form = Form.new
      @form.name = params[:name]
      @form.study_id = params[:study_id]
      @form.user_id = current_user.id
      @form.is_published = false
      @form.is_mobile = false
      if @form.save
        params[:fields].each do |field|
          Field.create_field(@form.id, field)
        end
      end
      render :json => response
    else
      @form = Form.get_form_by_form_id(params[:formid]).first
      @form.name = params[:name]
      @form.fields.each do |field|
        field.destroy
      end
      if @form.save
        params[:fields].each do |field|
          Field.create_field(@form.id, field)
        end
      end
      render :json => response
    end
  end

  def update

  end

  def new
  end

end