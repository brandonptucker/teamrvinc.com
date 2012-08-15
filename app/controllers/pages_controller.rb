class PagesController < ApplicationController
  def home
  end

  def contact
    @contact_message = ContactMessage.new
  end

  def send_contact_message
    @contact_message = ContactMessage.new(params[:contact_message])
    if @contact_message.valid?
      ContactMailer.new_message(@contact_message).deliver
      flash[:notice] = "Message sent! Thank you for contacting us."
      redirect_to contact_path
    else
      render :action => "contact"
    end
  end
end
