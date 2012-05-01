class AddStudyIdToDataSet < ActiveRecord::Migration
  def change
    add_column :data_sets, :study_id, :integer
  end
end
