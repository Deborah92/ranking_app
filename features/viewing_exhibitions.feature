Feature: Viewing exhibitions
  In order to view the exhibitions
  As an user
  I want to see them on that exhibition's page

  Background:
    Given there are the following types:
      | name                                     |
      | MONOGRÁFICA NACIONAL                     |
      | CONCURSO MONOGRÁFICO NACIONAL O REGIONAL |
      | Especial A.E.F.R.B.F.                    |
      | Punto Obligatorio                        |
      | EXPOSICIÓN INTERNACIONAL                 |
      | EXPOSICIÓN NACIONAL                      |

    Given there are the following exhibitions:
      | name         | date       | type                 |
      | exhibition 1 | 27/03/2015 | MONOGRÁFICA NACIONAL |
      | exhibition 2 | 15/07/2015 | Punto Obligatorio    |

    Given there are the following users:
      | email              | password | admin | image     | cahoot |
      | user1@example.com  | password | false | user.jpeg | true   |
      | user2@example.com  | password | false |           | true   |
      | user3@example.com  | password | false |           | false  |
      | admin@example.com  | password | true  |           | true   |

    And I am on the dogs page

  Scenario: Viewing exhibitions like an admin
    When I am signed in as "admin@example.com"
    And I follow "Exhibitions"
    Then I should see "exhibition 1"
    And I should see "exhibition 2"

  Scenario: Viewing exhibitions like a cahoot user
    When I am signed in as "user1@example.com"
    And I follow "Exhibitions"
    Then I should see "exhibition 1"
    And I should see "exhibition 2"

  Scenario: Viewing exhibitions like an admin
    When I am signed in as "user3@example.com"
    And I follow "Exhibitions"
    Then I should see "exhibition 1"
    And I should see "exhibition 2"