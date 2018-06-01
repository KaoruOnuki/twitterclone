class HowlMailer < ApplicationMailer
  default from: 'blog@howl.com'

  def howl_mail(howl)
    @howl = howl
    mail to: @howl.user.email, subject: "ご投稿完了のご連絡"
  end
end
