# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
TeamRV::Application.initialize!

ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  errors = Array(instance.error_message).map { |error| "<li>#{error}</li>"}.join("");
  unless html_tag =~/^<label/
    %(#{html_tag}<br><span class="help-inline"><ul>#{errors}</ul></span>).html_safe
  else
    html_tag
  end
end
