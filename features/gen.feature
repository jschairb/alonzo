Feature: Gen Command

  Background:
    Given a "gen" subcommand for "alonzo"
    And a project directory for "my_project"

  Scenario: Getting Help
    When I get help for the subcommand
    Then I should see an option for "root"
    And I should see an option for "type"

  Scenario: Generating a Ruby class
    Given I want to create a class called "User"
    And the project directory is empty
    When I generate my Ruby class
    Then there should be a valid class file
    And there should be a valid spec file
