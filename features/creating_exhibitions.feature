Feature: Creating exhibitions
  In order to create an exhibition
  As an admin
  I want to create them easily
  Background:
    Given there are the following exhibitions:
      | name         | date       | type   |
      | exhibition 1 | 27/03/2015 | type 1 |

    Given there are the following users:
      | email             | password | admin |
      | user@example.com  | password | false |
      | admin@example.com | password | true  |

    And I am on the dogs page

  Scenario: Creating an exhibition like an admin
    When I am signed in as "admin@example.com"
    And I follow "Exhibitions"
    And I follow "New Exhibition"
    And I fill in "Name" with "exhibition 2"
    And I click in "Date"
    And I fill in "datepicker" with "15/06/2015"
    And I fill in "Type" with "Type 2"
    And I press "Create Exhibition"
    Then I should see "Exhibition has been created."
    And I should see "exhibition 2"

  Scenario: Creating an exhibition like an other user
    When I am signed in as "user@example.com"
    And I follow "Exhibitions"
    And I follow "New Exhibition"
    Then I should see "You must be an admin to do that"