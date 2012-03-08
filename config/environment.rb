# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Site::Application.initialize!

# Customize field error div to work with Bootstrap
ActionView::Base.field_error_proc = Proc.new do |html, instance|
  html
end