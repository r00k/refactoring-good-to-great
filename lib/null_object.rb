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
    if contact && contact.company
      contact.company.name
    else
      'None'
    end
  end

  private

  attr_reader :contact
end

class Contact < OpenStruct
end

class Company < OpenStruct
  attr_accessor :company, :name

  def initialize(options)
    @company = options[:company]
    @name = options[:name]
  end
end

class Location
end
