# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
TeamRV::Application.initialize!

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  errors = Array(instance.error_message).map { |error| "#{error}"}.join(", ");
  if html_tag =~/^<label/
    index = html_tag.index("</label>");
    html_tag.insert(index, " #{errors}");
    html_tag
  else
    html_tag
  end
end
