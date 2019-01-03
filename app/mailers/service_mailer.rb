class ServiceMailer < ActionMailer::Base
  def new_appointment(service_appointment)
    @service_appointment = service_appointment
    mail(:to => "service@teamrvinc.com",
         :subject => "Service form: http://teamrvinc.com/services",
         :from => ENV['SMTP_USERNAME'],
         :reply_to => @service_appointment.email)
  end
end
