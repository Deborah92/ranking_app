Feature: Viewing results
  In order to view the results
  As an user
  I want to see them on that result's page

  Background:
    Given there are the following exhibitions:
      | name         | date       | type                 |
      | exhibition 1 | 27/03/2015 | MONOGRÁFICA NACIONAL |
      | exhibition 2 | 15/07/2015 | Punto Obligatorio    |

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
      | Sex  | Titles | Name                    | Birth Date | Owner             |
      | male |        | Samba y Fatiga Idilio   | 27/01/2006 | user1@example.com |
      | male |        | Fortunato Hautacuperche | 15/05/2008 | user2@example.com |

    Given there are the following results:
      | exhibition   | award         | dog                     | status  |
      | exhibition 1 | BOS           | Samba y Fatiga Idilio   | Pending |
      | exhibition 2 | MEJOR DE RAZA | Fortunato Hautacuperche | Pending |

    And there are the following users:
      | email             | password | admin |
      | user1@example.com | password | false |
      | user2@example.com | password | false |
      | admin@example.com | password | true  |



    And I am on the dogs page

  Scenario: Viewing results like an admin
    When I am signed in as "admin@example.com"
    And I follow "Administrar Resultados"
    Then you should see the admin results page

  Scenario: Viewing results like a user
    When I am signed in as "user1@example.com"
    And I follow "My Results"
    Then you should see the results page