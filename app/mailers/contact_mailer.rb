class ContactMailer < ActionMailer::Base
  def new_message(contact_message)
    @contact_message = contact_message
    mail(:to => "sales@teamrvinc.com",
         :subject => "Contact form: http://teamrvinc.com/contact",
         :from => ENV['SMTP_USERNAME'],
         :reply_to => @contact_message.email)
  end
end
