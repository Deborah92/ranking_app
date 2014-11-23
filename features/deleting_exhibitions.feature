Feature: Deleting exhibitions
  In order to remove needless exhibitions
  As an admin
  I want to make them disappear
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

  Scenario: Deleting an exhibition like an admin
    When I am signed in as "admin@example.com"
    And I follow "Exhibitions"
    And I follow "Delete" within "#exhibition_1"
    Then I should see "Exhibition has been deleted."
    And I should not see "exhibition 1"