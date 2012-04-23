class CreateVideoSurveys < ActiveRecord::Migration
  def change
    create_table :video_surveys do |t|
      t.integer :study_id
      t.integer :video_id

      t.timestamps
    end
  end
end
