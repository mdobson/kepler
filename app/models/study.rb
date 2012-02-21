class Study < ActiveRecord::Base
  after_create :create_admin_of_study

  belongs_to :user
	has_many :access_controls
	has_many :example_subjects
	has_many :announcements

  def create_admin_of_study
    @acl = AccessControl.new
    @acl.study_id = self.id
    @acl.user_id = self.user_id
    @acl.can_read = true
    @acl.can_write = true
    @acl.is_admin = true
    @acl.save
  end
end
