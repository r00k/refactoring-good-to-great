require_relative '../lib/null_object'

describe 'When a site has a contact' do
  before do
    company = Company.new(name: 'thoughtbot')
    @contact = Contact.new(name: 'John Smith', phone: '555-1212',
                           company: company)
    @site = JobSite.new(Location.new, @contact)
  end

  describe '#contact_name' do
    it "returns the contact's name" do
      @site.contact_name.should == 'John Smith'
    end
  end

  describe '#company_name' do
    it "returns the customer's company name" do
      @site.company_name.should == 'thoughtbot'
    end
  end

end

describe 'When a site lacks a contact' do
  before do
    @site = JobSite.new(Location.new, nil)
  end

  describe '#contact_name' do
    it 'returns no name'  do
      @site.contact_name.should == 'no contact'
    end
  end

  describe '#company_name' do
    it 'returns no company'  do
      @site.company_name.should == 'none'
    end
  end
end

describe 'When the contact has no company' do
  before do
    contact = Contact.new(name: 'John Smith', phone: '555-1212')
    @site = JobSite.new(Location.new, contact)
  end

  it 'returns none' do
    @site.company_name.should == 'none'
  end
end
