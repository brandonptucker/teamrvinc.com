class RVMailer < ActionMailer::Base
  def new_request(rv_request)
    @rv_request = rv_request
    mail(:to => "sales@teamrvinc.com",
         :subject => "RV form: http://teamrvinc.com/rvs/#{rv_request.id}",
         :from => ENV['SMTP_USERNAME'],
         :reply_to => @rv_request.email)
  end
end
