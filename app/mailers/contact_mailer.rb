class ContactMailer < ActionMailer::Base
  #default from: "from@example.com"
  layout 'contact'
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.confirmation.subject
  #
  # def confirmation
  #   @greeting = "Hi"

  #   mail to: "to@example.org"
  # end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.inquiry.subject
  #
  # def inquiry
  #   @greeting = "Hi"

  #   mail to: "to@example.org"
  # end
  # def confirmation(contact_message)
  #   @greeting = "Hallo"
  #   @contact_message = contact_message
  #   mail to: contact_message.email,
  #   from: ENV["MAIL_NAME"] + '<' + ENV["MAIL_USERNAME"] + '>',
  #   subject: "Wir haben Ihre Nachricht erhalten!"
  # end
def confirmation(email)
    @greeting = "Hallo"
mail to: email,
from: ENV["MAIL_USERNAME"],
subject: "Vielen Dank, Wir haben Ihre Nachricht erhalten!"
end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.inquiry.subject
  #
def inquiry(contact_message)
    @greeting = "Hallo"
@contact_message = contact_message
mail to: ENV["MAIL_USERNAME"],
from: contact_message.email,
subject: "Neue Anfrage von www.hansabau.de!"
end
  # def inquiry(contact_message)
  #   #@greeting = "Neue Anfrage von der Webseite!"
  #   @contact_message = contact_message
  #   mail to: ENV["MAIL_USERNAME"],
  #   from: contact_message.title + " " + contact_message.prename + " " + contact_message.name + '<' + contact_message.email + '>',
  #   subject: "Website-Anfrage: " + contact_message.subject
  # end
end
