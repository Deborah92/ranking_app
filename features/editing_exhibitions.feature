Feature: Editing Exhibitions
  In order to update exhibition information
  As an admin
  I want to be able to do that through an interface

  Background:
    Given there are the following exhibitions:
      | name         | date       | type                 |
      | exhibition 1 | 27/03/2015 | MONOGRÁFICA NACIONAL |
      | exhibition 2 | 15/07/2015 | Punto Obligatorio    |

    Given there are the following users:
      | email             | password | admin |
      | user@example.com  | password | false |
      | admin@example.com | password | true  |

    And I am on the dogs page

  Scenario: Updating a exhibition like an admin
    When I am signed in as "admin@example.com"
    And I follow "Exhibitions"
    And I follow "Edit" within "#exhibition_1"
    And I fill in "Name" with "exhibition beta 1"
    And I press "Update Exhibition"
    Then I should see "Exhibition has been updated."
    And I should see "exhibition beta 1"
    And I should not see "exhibition 1"

  Scenario: Updating a exhibition like an other user
    When I am signed in as "user@example.com"
    And I follow "Exhibitions"
    And I follow "Edit" within "#exhibition_1"
    Then I should see "You must be an admin to do that"

  Scenario: Updating a exhibition without name
    When I am signed in as "admin@example.com"
    And I follow "Exhibitions"
    And I follow "Edit" within "#exhibition_1"
    And I fill in "Name" with ""
    And I press "Update Exhibition"
    Then I should see "Exhibition has not been updated."
    And I should see "Name can't be blank"

  Scenario: Updating a exhibition without date
    When I am signed in as "admin@example.com"
    And I follow "Exhibitions"
    And I follow "Edit" within "#exhibition_1"
    And I click in "Date"
    And I fill in "datepicker" with ""
    And I press "Update Exhibition"
    Then I should see "Exhibition has not been updated."
    And I should see "Date can't be blank"

  Scenario: Updating a exhibition with date at the past
    And I am signed in as "admin@example.com"
    And I follow "Exhibitions"
    When I follow "Edit" within "#exhibition_1"
    And I click in "Date"
    And I fill in "datepicker" with "15/05/2004"
    And I press "Update Exhibition"
    Then I should see "Exhibition has not been updated."
    Then I should see "Date can not be at the past"