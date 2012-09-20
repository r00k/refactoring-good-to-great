require 'ostruct'

class JobSite
  attr_reader :contact

  def initialize(location, contact)
    @location = location
    @contact = contact
  end

  def contact_name
    if contact
      contact.name
    else
      'no name'
    end
  end

  def contact_phone
    if contact
      contact.phone
    else
      'no phone'
    end
  end

  def email_contact(email_body)
    if contact
      contact.deliver_personalized_email(email_body)
    end
  end
end

class Contact < OpenStruct
  def deliver_personalized_email(email)
    email.deliver(name)
  end
end
