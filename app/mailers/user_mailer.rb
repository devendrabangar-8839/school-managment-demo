class UserMailer < ApplicationMailer
  default from: 'smp_admin@gmail.com'

  def welcome_email(user_id)
    @user = User.find_by(id: user_id)
    if @user
      @url  = 'http://127.0.0.1:3000/login'
      mail(to: @user.email, subject: 'Welcome to School Managment App',)
    end
  end
end
