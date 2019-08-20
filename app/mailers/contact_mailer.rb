class ContactMailer < ApplicationMailer
  def contact_mail
    mail to: "ralralph@gmail.com", subject: "投稿完了メール"
  end
end