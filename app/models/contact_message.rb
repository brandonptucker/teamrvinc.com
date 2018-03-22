class ContactMessage
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  
  attr_accessor :name, :email, :phone, :message
  
  validates :name, :email, :phone, :message, :presence => true
  validates :email, :format => { :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i }
  validates :phone, :length => { :is => 10}
  validates :message, :length => { :maximum => 1220 }

  def initialize(attributes = {})
    attributes.each do |name, value|
      if name.eql? "phone"
        # Remove all non-numeric characters
        send("#{name}=", value.gsub(/\D/, ''))
      else
        send("#{name}=", value)
      end
    end
  end
  
  def persisted?
    false
  end
end