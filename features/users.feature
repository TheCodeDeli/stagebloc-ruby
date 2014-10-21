Feature: Users

  Scenario: Get user information by id
    Given I've added my credentials
    When I get user information by id
    Then I should have the user's information
