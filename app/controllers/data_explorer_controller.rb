class DataExplorerController < ApplicationController
  layout 'with_links'

  def index
  	@form = Form.get_forms_by_study_id(params[:study_id]).first
  	@uuids = Datum.select("DISTINCT uuid").where("form_id = ?", @form.id)
  	@data_sets = DataSet.get_data_sets_by_study_id(params[:study_id])
  end

end
