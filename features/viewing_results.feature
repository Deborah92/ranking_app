Feature: Viewing results
  In order to view the results
  As an user
  I want to see them on that result's page

  Background:
    Given there are the following exhibitions:
      | name         | date       | type                 |
      | exhibition 1 | 27/03/2015 | MONOGRÁFICA NACIONAL |
      | exhibition 2 | 15/07/2015 | Punto Obligatorio    |
      | exhibition 3 | 12/03/2015 | EXPOSICIÓN NACIONAL  |

    Given there are the following awards:
      | award             |
      | B.I.S.            |
      | 2º B.I.S.         |
      | 3º B.I.S.         |
      | 1º GRUPO          |
      | 2ºGRUPO           |
      | 3º GRUPO          |
      | MEJOR DE RAZA     |
      | BOS               |
      | CACIB             |
      | R.CACIB           |
      | RAPPEL CAC        |
      | CAC               |
      | R.CAC             |
      | Mejor Joven       |
      | CCJ/Exc.1 (Joven) |

    And there are the following dogs:
      | Sex  | Titles | Name                    | Birth Date | Owner             | Image      |
      | male |        | Samba y Fatiga Idilio   | 27/01/2006 | user1@example.com | perro.jpeg |
      | male |        | Fortunato Hautacuperche | 15/05/2008 | user2@example.com |            |
      | male |        | Frael Valderrama        | 01/01/2001 | user3@example.com |            |

    And there are the following results:
      | exhibition | award | dog | status    |
      | 1          | 8     | 1   | Pending   |
      | 2          | 7     | 2   | Rejected  |
      | 3          | 12    | 1   | Validated |
      | 3          | 2     | 3   | Validated |

    Given there are the following users:
      | email              | password | admin | image     | cahoot |
      | user1@example.com  | password | false | user.jpeg | true   |
      | user2@example.com  | password | false |           | true   |
      | user3@example.com  | password | false |           | false  |
      | admin@example.com  | password | true  |           | true   |


    And I am on the dogs page

  Scenario: Viewing results like an admin
    When I am signed in as "admin@example.com"
    And I follow "Results management"
    Then I should see the admin results page
    And I should see "exhibition 1 BOS Samba y Fatiga Idilio Pending"
    And I should see "exhibition 2 MEJOR DE RAZA Fortunato Hautacuperche Rejected"
    And I should see "exhibition 3 CAC Samba y Fatiga Idilio Validated"
    And I should see "exhibition 3 2º B.I.S. Frael Valderrama Validated"

  @working
  Scenario: Viewing results like a cahoot user
    When I am signed in as "user1@example.com"
    And I follow "My results"
    Then I should see the results page

  Scenario: Viewing results like a registered user
    When I am signed in as "user3@example.com"
    And I follow "My results"
    Then I should see the results page