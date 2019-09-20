class ApplicationMailer < ActionMailer::Base
  default from: 'fetchmeaband@gmail.com'
  layout 'mailer'

   def welcome_email(user)
    #we take instance user to be able to have @user in view
    @user = user

    #variable @url define to use it in email view
    @url = 'https.//fetchmeaband.herokuapp.com'

    #this call to mail() permit to send the e-mail by defining receiptor and subject.
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end
  
   def contact_form(contact)
    @contact = contact
    @to = "fetchmeaband@gmail.com>"
 
    mail(to: @to, subject: "Nouveau contact depuis le site") do |format|
      format.html
    end
  end
end

