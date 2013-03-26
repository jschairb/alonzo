Given(/^a "(.*?)" subcommand for "(.*?)"$/) do |subcommand, command|
  @subcommand = subcommand
  @command    = command
end

Given(/^a project directory for "(.*?)"$/) do |project_directory|
  @project_directory = File.join(root_path, "tmp", project_directory)
  FileUtils.rm_r(@project_directory)
  FileUtils.mkdir_p(@project_directory)
end

Given(/^I want to create a class called "(.*?)"$/) do |klass_name|
  @klass_name     = klass_name
  @klass_filename = "#{@klass_name.underscore}.rb"
  @spec_filename  = "#{@klass_name.underscore}_spec.rb"
  @klass_file     = File.join(@project_directory, "lib", @klass_filename)
  @spec_file      = File.join(@project_directory, "spec", @spec_filename)
end

Given(/^the project directory is empty$/) do
  step %{a file named "#{@klass_file}" should not exist}
  step %{a file named "#{@spec_file}" should not exist}
end

When(/^I generate my Ruby class$/) do
  step %(I run `bundle exec #{root_path}/bin/#{@command} #{@subcommand} -r #{@project_directory} #{@klass_name}`)
end

When /^I get help for "([^"]*)"$/ do |app_name|
  @app_name = app_name
  step %(I run `bundle exec #{root_path}/bin/#{app_name} help`)
end

When /^I get help for the subcommand$/ do
  step %(I run `bundle exec #{root_path}/bin/#{@command} help #{@subcommand}`)
end

When(/^I get help for "(.*?)" command "(.*?)"$/) do |app_name, subcommand|
  @app_name   = app_name
  @subcommand = subcommand
  step %(I run `bundle exec #{root_path}/bin/#{app_name} help #{subcommand}`)
end

Then(/^I should see an option for "(.*?)"$/) do |option|
  step %{the output should contain "--#{option}"}
end

Then(/^there should be a valid class file$/) do
  step %{there should be a valid file named "#{@klass_file}"}
end

Then(/^there should be a valid spec file$/) do
  step %{there should be a valid file named "#{@spec_file}"}
end

Then(/^there should be a valid file named "(.*?)"$/) do |filename|
  step %{a file named "#{filename}" should exist}
  checking_command = "#{current_ruby} -c #{filename}"
  step %{I run `#{checking_command}`}
  step %{the output from "#{checking_command}" should contain "Syntax OK"}
end

def root_path
  File.expand_path(File.join(File.dirname(__FILE__), "..", ".."))
end
