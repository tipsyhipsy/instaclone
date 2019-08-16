class ContactMailer < ApplicationMailer
  default form: 'ralralph@gmail.com'

  def posted_email(user)
    @user = user
    mail(to: @user.email, subject: '画像を投稿しました。')
  end
end
