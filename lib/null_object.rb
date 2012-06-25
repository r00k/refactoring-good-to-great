require 'ostruct'

class JobSite
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
      'No Contact'
    end
  end

  def company_name
    if contact
      contact.company_name
    else
      'None'
    end
  end

  private

  attr_reader :contact
end

class Contact < OpenStruct
  def company_name
    company.name
  end
end

class Company < OpenStruct
end

class Location
end
