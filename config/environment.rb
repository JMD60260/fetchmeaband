# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

my_date_formats = { default: '%d/%m/%Y' }
Time::DATE_FORMATS.merge!(my_date_formats)
Date::DATE_FORMATS.merge!(my_date_formats)

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  user_name: ENV['SENDGRID_LOGIN'],
  password: ENV['SENDGRID_PWD'],
  domain: 'fetchmeaband.herokuapp.com',
  address: 'smtp.sendgrid.net',
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}
