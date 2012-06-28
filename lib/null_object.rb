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
      'no contact'
    end
  end

  def company_name
    if contact
      contact.company_name
    else
      'none'
    end
  end

  private

  attr_reader :contact
end

class Contact < OpenStruct
  attr_reader :name, :company

  def initialize(name, company)
    @name = name
    @company = company
  end

  def company_name
    if company
      company.name
    else
      'none'
    end
  end
end

class Company < OpenStruct
end

class Location
end
