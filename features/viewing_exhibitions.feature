Feature: Viewing exhibitions
  In order to view the exhibitions
  As an user
  I want to see them on that exhibition's page

  Background:
    Given there are the following exhibitions:
      | name         | date       | type      |
      | exhibition 1 | 27/03/2015 | B.I.S.    |
      | exhibition 2 | 15/07/2015 | 2º B.I.S. |

    Given there are the following users:
      | email             | password | admin |
      | user@example.com  | password | false |
      | admin@example.com | password | true  |

    And I am on the dogs page

  Scenario: Viewing exhibitions
    When I am signed in as "user@example.com"
    And I follow "Exhibitions"
    Then I should see "exhibition 1"
    And I should see "exhibition 2"