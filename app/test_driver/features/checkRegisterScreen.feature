# Acceptance test 1 - Iteration 4
Feature: Filters page displays the correct information
  Scenario: Going to filter page and clicking on some filters
    Given I am on "mapScreen"
    When I tap "userButton"
    And I tap "noAccount"
    Then I should have "signUpScreen"