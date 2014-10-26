Feature: Creating exhibitions
  In order to create an exhibition
  As an admin
  I want to create them easily
  Background:
    Given there are the following exhibitions:
      | name         | date       | type                 |
      | exhibition 1 | 27/03/2015 | MONOGRÁFICA NACIONAL |

    Given there are the following users:
      | email             | password | admin |
      | user@example.com  | password | false |
      | admin@example.com | password | true  |

    And I am on the dogs page
  @working
  Scenario: Creating an exhibition like an admin
    When I am signed in as "admin@example.com"
    And I follow "Exhibitions"
    And I follow "New Exhibition"
    And I fill in "Name" with "exhibition 2"
    And I click in "Date"
    And I fill in "datepicker" with "15/06/2015"
    And Save and open page
    And I select "MONOGRÁFICA NACIONAL" from "Type"
    And I press "Create Exhibition"
    Then I should see "Exhibition has been created."
    And I should see "exhibition 2"

  Scenario: Creating an exhibition like an other user
    When I am signed in as "user@example.com"
    And I follow "Exhibitions"
    And I follow "New Exhibition"
    Then I should see "You must be an admin to do that"

Scenario: Creating an exhibition without name
    When I am signed in as "admin@example.com"
    And I follow "Exhibitions"
    And I follow "New Exhibition"
    And I fill in "Name" with ""
    And I click in "Date"
    And I fill in "datepicker" with "15/06/2015"
    And Save and open page
    And I select "MONOGRÁFICA NACIONAL" from "Type"
    And I press "Create Exhibition"
    Then I should see "Exhibition has not been created."
    And I should see "Name can't be blank"

  Scenario: Creating an exhibition without date
    When I am signed in as "admin@example.com"
    And I follow "Exhibitions"
    And I follow "New Exhibition"
    And I fill in "Name" with "exhibition 2"
    And I click in "Date"
    And I fill in "datepicker" with ""
    And I select "MONOGRÁFICA NACIONAL" from "Type"
    And I press "Create Exhibition"
    Then I should see "Exhibition has not been created."
    And I should see "Date can't be blank"

  Scenario: Creating an exhibition without type
    When I am signed in as "admin@example.com"
    And I follow "Exhibitions"
    And I follow "New Exhibition"
    And I fill in "Name" with "exhibition 2"
    And I click in "Date"
    And I fill in "datepicker" with "15/06/2015"
    And I select "Type..." from "Type"
    And I press "Create Exhibition"
    Then I should see "Exhibition has not been created."
    And I should see "Type can't be blank"

  Scenario: Creating an exhibition with date at the past
    And I am signed in as "admin@example.com"
    And I follow "Exhibitions"
    When I follow "New Exhibition"
    And I fill in "Name" with "exhibition 2"
    And I click in "Date"
    And I fill in "datepicker" with "15/05/2004"
    And I select "MONOGRÁFICA NACIONAL" from "Type"
    And I press "Create Exhibition"
    Then I should see "Exhibition has not been created."
    Then I should see "Date can not be at the past"