require 'view_plumbing'

class User
  attr_reader :name

  def initialize(name, is_admin)
    @name = name
    @is_admin = is_admin
  end

  def admin?
    @is_admin
  end
end
