class User # < ActiveRecord::Base
  def save
    # Do ActiveRecord#save stuff.
    after_save
  end

  private

  def after_save
    send_welcome_email
    generate_example_project
  end

  def send_welcome_email
    WelcomeEmail.send_to(self)
  end

  def generate_example_project
    ExampleProject.generate_for(self)
  end
end

class WelcomeEmail
  def self.send_to(user)
  end
end

class ExampleProject
  def self.generate_for(user)
  end
end
