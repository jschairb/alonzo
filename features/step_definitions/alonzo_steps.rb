When /^I get help for "([^"]*)"$/ do |app_name|
  @app_name = app_name
  step %(I run `bundle exec #{root_path}/bin/#{app_name} help`)
end

When(/^I get help for "(.*?)" command "(.*?)"$/) do |app_name, subcommand|
  @app_name   = app_name
  @subcommand = subcommand
  step %(I run `bundle exec #{root_path}/bin/#{app_name} help #{subcommand}`)
end

Then(/^I should see an option for "(.*?)"$/) do |option|
  expect(all_output).to contain("--#{option}")
end

def root_path
  File.expand_path(File.join(File.dirname(__FILE__), "..", ".."))
end
