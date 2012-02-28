class Notification < ActionMailer::Base
  default from: "noreply@studycache.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.study.subject
  #
  def study(accessControl)
    subject     "You've been added to #{accessControl.study.title}"
    sent_on     Time.now

    mail to: accessControl.user.email
  end
end
