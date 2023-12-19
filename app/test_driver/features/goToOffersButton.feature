# Acceptance test 1 - Iteration 1
Feature: Map Screen changes to Offers Screen
  Scenario: When I am on Map Screen and I click the offers button it changes to Offers Screen
    Given I am on "mapScreen"
    When I tap "searchButton"
    Then I should have "offersScreen"