class RecordController < ApplicationController
  layout 'with_links'

  def show
  	@record = DataSet.find(params[:id])
  end

end
