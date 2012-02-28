class Notification < ActionMailer::Base
  default from: "noreply@studycache.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.study.subject
  #
  def study(accessControl)
    #@acl = accessControl
    mail(:to => accessControl.user.email, :subject =>"You've been added to #{accessControl.study.title}") 
  end

  def registration(user)
    mail(:to => user.email, :subject =>"Thanks for registering at StudyCache!")
  end
end
