# Acceptance test 2 - Iteration 1
Feature: Jobs appear in Offers Screen
  Scenario: When I am on Offers Screen I should see jobs
    Given I am on "mapScreen"
    Then I tap "searchButton"
    Then I should have "job"
    When I scroll "jobList" for 2 seconds
    Then I should have "job"