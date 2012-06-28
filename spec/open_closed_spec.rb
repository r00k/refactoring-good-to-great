require 'spec_helper'
require_relative '../lib/open_closed'

describe User do
  describe '#save' do
    before do
      @user = User.new
    end

    it 'sends a welcome email' do
      WelcomeEmail.expects(:send_to)
      @user.save
    end

    it 'generates an example project' do
      ExampleProject.expects(:generate_for)
      @user.save
    end
  end
end
