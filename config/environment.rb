# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!


# Sendgrid email
ActionMailer::Base.smtp_settings = {
  :user_name => 'lasernite',
  :password => 'puremailparameters9',
  :domain => 'elvent.io',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}