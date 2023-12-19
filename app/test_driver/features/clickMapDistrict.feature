# Acceptance test 1 - Iteration 2
Feature: Clicking a district from map and seeing its information
  Scenario: When I am on MapScreen and I click on a district it changes to DistrictScreen and displays district's information
    Given I am on "mapScreen"
    Then I should have "mapImage"
    And I should have "aveiro"
    When I tap "aveiro"
    Then I should have "districtScreen1"
    When I tap "districtJobsButton"
    Then I should have "job"
