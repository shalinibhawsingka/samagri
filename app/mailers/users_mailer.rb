class UsersMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.users_mailer.Update.subject
  #
  def Update(issue)
    @user = issue.user
    mail(to: @user.email, subject: "Update")
  end
end
