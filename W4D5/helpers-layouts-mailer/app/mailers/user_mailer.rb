class UserMailer < ApplicationMailer
  # include Rails.application.routes.url_helpers
  default from: 'App Academy <everybody@appacademy.io>'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/session/new'
    mail(to: user.username, subject: 'Welcome to 99 Cats!')
  end
end
