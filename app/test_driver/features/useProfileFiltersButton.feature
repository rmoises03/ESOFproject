# Acceptance test 2 - Iteration 3
Feature: The button to use profile settings as filter is displaying and working propertly
  Scenario: When I press this button, it stays in the same screen
    Given I am on "mapScreen"
    When I tap "filterButton"
    And I tap "useProfileAsFilterButton"
    Then I should have "filterScreen"
