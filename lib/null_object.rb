require 'ostruct'

class JobSite
  attr_reader :contact

  def initialize(location, contact)
    @location = location
    @contact = contact
  end

  def location_city
    location.city
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

  def email_contact(email)
    if contact
      email.deliver(contact.name)
    end
  end
end

class Contact < OpenStruct
end

class Location
end

class Mailer
end
