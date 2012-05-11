class FormBuilderController < ApplicationController
  layout 'with_links'
  respond_to :json

  def index
    if(params.has_key?(:id))
      responseStruct = Form.to_json(params)
      render :json => responseStruct
    end
  end

  def create
    if(!params.has_key?(:formid))
      flag = Form.create_new_form(params, current_user.id)
      render :json => flag.to_json
    else
      flag = Form.update_old_form(params)
      render :json => flag.to_json
    end
  end

  def update

  end

  def new
  end

end