Feature: Gen Command

  Scenario: Getting Help
    When I get help for "alonzo" command "gen"
    Then I should see an option for "root"
    And I should see an option for "type"

