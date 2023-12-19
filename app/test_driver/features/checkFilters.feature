# Acceptance test 2 - Iteration 2
Feature: Filters page displays the correct information
  Scenario: Going to filter page and clicking on some filters
    Given I am on "mapScreen"
    When I tap "filterButton"
    Then I should have "filterScreen"
    And I tap "checkBoxSalary0"
    And I tap "checkBoxRemote"
    And I tap "checkBoxTechnology0"