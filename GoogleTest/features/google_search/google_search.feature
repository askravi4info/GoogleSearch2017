@patch @google_search
Feature: Google Search

  Background:
    Given user is on Google Home page

  @manual
  Scenario: verify the user is able to search for the valid data
    When user search for sony laptops
    And select sony laptops from the list
    Then verify the user gets the 24,600,000 search results

  Scenario: verify the google search functionality
    Then user should get the search results for the valid data

  Scenario Outline: verify the user is able to get the search results for the given data
    And user search for <search_criteria>
    And select <recommended_item> from the list
    Then verify the user gets the <no_of_results> search results
    Examples:
      | search_criteria | recommended_item | no_of_results |
      | dell laptops    | dell laptops     | 17,800,000    |
      | sony laptops    | sony laptops     | 24,600,000    |
      | toshiba laptops | toshiba laptops  | 8,150,000     |

  @smoke
  Scenario: verify the user is able to get the search results for the given data without closing the browser
    Then user should get the search results for the valid data
    And verify the following
      | details                         | wiki_details     |
      | Shop for sony laptops on Google | vaio - Wikipedia |


  @regression @qa
  Scenario: testing the yml files
    Then verify user can access data from yml files

  @wip
  Scenario: verify the search settings gives correct results
    And user searches for the data which is not a valid case
    Then user gets an errror message


#  Scenario: Verify the user gets an error message when searching for Past date
#    And user selects Columbus, OH airport for the city columbus from departure field
#    And user selects Cleveland, OH airport for the city cleveland from arrival field
#    And user makes a past date flight search
#    And user searches for the flights availability
#    Then verify the "Departing date is in the past. Please enter a valid departing date." error message is displayed
#
#
#  Scenario: Verify the user gets the correct flight search results
#    And user selects Columbus, OH airport for the city columbus from departure field
#    And user selects Cleveland, OH airport for the city cleveland from arrival field
#    And user makes a future date flight search
#    And user searches for the flights availability
#    Then verify the Select your departure to Cleveland message is displayed in the flight search page
#
#
#  Scenario Outline: Verify the user gets the available flights for the future date
#    And user selects <departure_airport> airport for the city <dep_city_name> from departure field
#    And user selects <arrival_airport> airport for the city <arr_city_name> from arrival field
#    And user makes a future date flight search
#    And user searches for the flights availability
#    Then verify the <message> message is displayed in the flight search page
#  Examples:
#    | dep_city_name | arr_city_name | departure_airport | arrival_airport | message                            |
#    | columbus      | cleveland     | Columbus, OH      | Cleveland, OH   | Select your departure to Cleveland |
#    | Los Angeles   | cleveland     | Los Angeles, CA   | Cleveland, OH   | Select your departure to Cleveland |
#
#  Scenario:Verify different error messages when searching for past flights
#    And user selects Columbus, OH airport for the city columbus from departure field
#    And user selects Cleveland, OH airport for the city cleveland from arrival field
#    And user makes a past date flight search
#    And user searches for the flights availability
#    Then verify the following error message are displayed
#      | error_messages                                                      | dates |
#      | Departing date is in the past. Please enter a valid departing date. | +2    |
#      | Returning date is in the past. Please enter a valid returning date. | -2    |
#
#  Scenario: Verify the flight search results are sorted by Price
#    And user selects Columbus, OH airport for the city columbus from departure field
#    And user selects Cleveland, OH airport for the city cleveland from arrival field
#    And user makes a future date flight search
#    And user searches for the flights availability
#    Then verify the Select your departure to Cleveland message is displayed in the flight search page
#    Then verify the flight search results are sorted by price
#
#  Scenario: Verify the flight search results are sorted by Price by default
#    And user searches for a valid future flight
#    Then verify the flight search results are sorted by price
#
#
