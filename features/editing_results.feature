Feature: Editing Results
  In order to update result information
  As an admin
  I want to be able to do that through an interface

  Background:
    Given there are the following results:
      | exhibition   | award | dog                   | status  |
      | exhibition 1 | BOS   | Samba y Fatiga Idilio | Pending |

    And there are the following users:
      | email             | password | admin | image     |
      | user1@example.com | password | false | user.jpeg |
      | user2@example.com | password | false |           |
      | admin@example.com | password | true  |           |

    And there are the following dogs:
      | Sex  | Titles | Name                    | Birth Date | Owner             | Image      |
      | male |        | Samba y Fatiga Idilio   | 27/01/2006 | user1@example.com | perro.jpeg |
      | male |        | Fortunato Hautacuperche | 15/05/2008 | user2@example.com |            |

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

    And I am on the dogs page

  Scenario: Updating a result like an admin
    When I am signed in as "admin@example.com"
    And I follow "Administrar Resultados"
    And I follow "Edit" within "#result_1"
    And I select "Validated" from "Status"
    And I press "Update Result"
    Then I should see "Result has been updated. A message with the result's link has been sent to user email address"