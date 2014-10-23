Feature: Deleting exhibitions
  In order to to remove needless exhibitions
  As an admin
  I want to make them disappear
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

  Scenario: Deleting an exhibition like an admin
    When I am signed in as "admin@example.com"
    And I follow "Exhibitions"
    And I follow "Delete" within "#exhibition_1"
    Then I should see "Exhibition has been deleted."
    And I should not see "exhibition 1"

  Scenario: Deleting an exhibition like other user
    When I am signed in as "user@example.com"
    And I follow "Exhibitions"
    And I follow "Delete" within "#exhibition_1"
    Then I should see "You must be an admin to do that"