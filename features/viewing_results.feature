Feature: Viewing results
  In order to view the results
  As an user
  I want to see them on that result's page

  Background:
    Given there are the following exhibitions:
      | name         | date       | type                 |
      | exhibition 1 | 27/03/2014 | MONOGRÁFICA NACIONAL |
      | exhibition 2 | 15/07/2014 | Punto Obligatorio    |
      | exhibition 3 | 12/03/2014 | EXPOSICIÓN NACIONAL  |

    Given there are the following awards:
      | award |
      | 1     |
      | 2     |
      | 3     |
      | 4     |
      | 5     |
      | 6     |
      | 7     |
      | 8     |
      | 9     |
      | 10    |
      | 11    |
      | 12    |
      | 13    |
      | 14    |
      | 15    |

    And there are the following dogs:
      | Sex  | Titles | Name                    | Birth Date | Owner             | Image      |
      | male |        | Samba y Fatiga Idilio   | 27/01/2006 | user1@example.com | perro.jpeg |
      | male |        | Fortunato Hautacuperche | 15/05/2008 | user2@example.com |            |
      | male |        | Frael Valderrama        | 01/01/2001 | user3@example.com |            |

    And there are the following results:
      | exhibition | award | dog | status    |
      | 1          | 8     | 1   | Pending   |
      | 2          | 8     | 2   | Validated |

    Given there are the following users:
      | email              | password | admin | image     | cahoot |
      | user1@example.com  | password | false | user.jpeg | true   |
      | user2@example.com  | password | false |           | true   |
      | user3@example.com  | password | false |           | false  |
      | admin@example.com  | password | true  |           | true   |


    And I am on the dogs page

  Scenario: Viewing results like an admin
    When I am signed in as "admin@example.com"
    And I follow "Results"
    Then I should see the admin results page
    And I should see "exhibition 1 BOS Samba y Fatiga Idilio Pending"
    And I should see "exhibition 2 BOS Fortunato Hautacuperche Validated"

  @working
  Scenario: Viewing results like a cahoot user
    When I am signed in as "user1@example.com"
    And I follow "My results"
    Then I should see the results page

  Scenario: Viewing results like a registered user
    When I am signed in as "user3@example.com"
    And I follow "My results"
    Then I should see the results page