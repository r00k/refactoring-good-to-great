require_relative '../lib/deco'
require 'view_matcher'

describe View do
  context 'when user is an admin' do
    before do
      @user = User.new('bob', true)
      @view = View.new(File.read('views/deco.html.erb'), binding)
    end

    it 'greets him as an admin' do
      @view.should include_text("Hail administrator #{@user.name}")
    end
  end

  context 'when the user is logged in but not an admin' do
    before do
      @user = User.new('bob', false)
      @view = View.new(File.read('views/deco.html.erb'), binding)
    end

    it 'greets him as a user' do
      @view.should include_text("Welcome user #{@user.name}")
    end
  end
end
