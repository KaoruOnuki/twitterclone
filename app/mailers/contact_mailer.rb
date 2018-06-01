class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: @contact.email, subject: "お問い合わせ受け取りのご連絡"
  end
end
