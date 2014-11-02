Feature: Creating results
  In order to create an result
  As a user
  I want to create them easily
  Background:
    Given there are the following results:
      | exhibition   | award | dog                   | status  |
      | exhibition 1 | BOS   | Samba y Fatiga Idilio | Pending |

    And there are the following users:
      | email             | password | admin |
      | user1@example.com | password | false |
      | user2@example.com | password | false |
      | admin@example.com | password | true  |

    And there are the following dogs:
      | Sex  | Titles | Name                    | Birth Date | Owner             |
      | male |        | Samba y Fatiga Idilio   | 27/01/2006 | user1@example.com |
      | male |        | Fortunato Hautacuperche | 15/05/2008 | user2@example.com |

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

  Scenario: Creating a result like an admin
    When I am signed in as "admin@example.com"
    And I follow "Administrar Resultados"
    And I follow "New Result"
    And I select "exhibition 2" from "Exhibition"
    And I select "MEJOR DE RAZA" from "Award"
    And I select "Fortunato Hautacuperche" from "Dog"
    And I select "Validated" from "Status"
    And I press "Create Result"
    Then I should see "Result has been created."

  Scenario: Creating a result like a user
    When I am signed in as "user2@example.com"
    And I follow "My Results"
    And I follow "New Result"
    And I select "exhibition 2" from "Exhibition"
    And I select "MEJOR DE RAZA" from "Award"
    And I select "Fortunato Hautacuperche" from "Dog"
    And I press "Create Result"
    Then I should see "Result has been created."

  Scenario: Creating a result without exhibition
    When I am signed in as "user2@example.com"
    And I follow "My Results"
    And I follow "New Result"
    And I select "Exhibition..." from "Exhibition"
    And I select "MEJOR DE RAZA" from "Award"
    And I select "Fortunato Hautacuperche" from "Dog"
    And I press "Create Result"
    Then I should see "Result has not been created."
    And I should see "Exhibition can't be blank"

  Scenario: Creating a result without award
    When I am signed in as "user2@example.com"
    And I follow "My Results"
    And I follow "New Result"
    And I select "exhibition 2" from "Exhibition"
    And I select "Award..." from "Award"
    And I select "Fortunato Hautacuperche" from "Dog"
    And I press "Create Result"
    Then I should see "Result has not been created."
    And I should see "Award can't be blank"

  Scenario: Creating a result without dog
    When I am signed in as "user2@example.com"
    And I follow "My Results"
    And I follow "New Result"
    And I select "exhibition 2" from "Exhibition"
    And I select "MEJOR DE RAZA" from "Award"
    And I select "Dog..." from "Dog"
    And I press "Create Result"
    Then I should see "Result has not been created."
    And I should see "Dog can't be blank"
