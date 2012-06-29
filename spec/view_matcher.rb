RSpec::Matchers.define :include_text do |expected_text|
  match do |view|
    view.contents.chomp.include? expected_text
  end
end
