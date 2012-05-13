class RecordController < ApplicationController
  def show
  	@record = DataSet.find(params[:id])
  end

end
