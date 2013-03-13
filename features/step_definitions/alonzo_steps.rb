When /^I get help for "([^"]*)"$/ do |app_name|
  @app_name = app_name
  root = File.expand_path(File.join(File.dirname(__FILE__), "..", ".."))
  step %(I run `bundle exec #{root}/bin/#{app_name} help`)
end

# Add more step definitions here
