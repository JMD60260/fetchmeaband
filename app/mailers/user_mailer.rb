# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: 'fetchmeaband@gmail.com'

  def welcome_email(user)
    # we take instance user to be able to have @user in view
    @user = user

    # variable @url define to use it in email view
    @url = 'https://fetchmeaband.herokuapp.com/login'

    # this call to mail() permit to send the e-mail by defining receiptor and subject.
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end

  def newsletter_mailer
    @newsletter = Newsletter.all
    emails = @newsletter.collect(&:email).join(', ')
    mail(to: emails, subject: 'Hi, this is a test mail.')
  end
end
