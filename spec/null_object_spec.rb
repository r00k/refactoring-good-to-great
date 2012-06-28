require_relative '../lib/null_object'

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

  describe '#contact_address' do
    it "returns the contact's address" do
      @site.contact_address.should == '123 Main St'
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

  describe '#contact_address' do
    it 'returns a null address'  do
      @site.contact_address.should == 'no address'
    end
  end
end
