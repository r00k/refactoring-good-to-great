require_relative '../lib/null_object'
require 'spec_helper'

describe 'When a site has a contact' do
  before do
    @contact = Contact.new(name: 'John Smith',
                           phone: '555-1212',
                           address: '123 Main St')

    @site = JobSite.new(Location.new, @contact)
  end

  describe '#contact_name' do
    it "returns the contact's name" do
      @site.contact_name.should == 'John Smith'
    end
  end

  describe '#contact_phone' do
    it "returns the customer's phone number" do
      @site.contact_phone.should == '555-1212'
    end
  end

  describe '#email_contact' do
    it "sends an email to the contact" do
      email = mock('email')
      email.expects(:deliver).with('John Smith').once

      @site.email_contact(email)
    end
  end
end

describe 'When a site lacks a contact' do
  before do
    @site = JobSite.new(Location.new, nil)
  end

  describe '#contact_name' do
    it 'returns a null name'  do
      @site.contact_name.should == 'no name'
    end
  end

  describe '#contact_phone' do
    it 'returns a null phone'  do
      @site.contact_phone.should == 'no phone'
    end
  end

  describe '#email_contact' do
    it "does not email the contact" do
      email = mock('email')
      email.expects(:deliver).never

      @site.email_contact(email)
    end
  end
end
