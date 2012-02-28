class StudyNotifier < ActionMailer::Base
  def addition_to_study_notification(accessControl)
  	recipients 		"#{accessControl.user.email}"
  	from 			"StudyCache Team"
  	subject 		"You've been added to #{accessControl.study.title}"
  	sent_on 		Time.now
  	body 			{ :email => accessControl.user.email, :study => accessControl.study.title }
end
