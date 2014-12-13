Feature: Deleting results
  In order to remove needless result
  As a user
  I want to make them disappear

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

    And there are the following users:
      | email              | password | admin | image     | cahoot |
      | user1@example.com  | password | false | user.jpeg | true   |
      | user2@example.com  | password | false |           | true   |
      | user3@example.com  | password | false |           | false  |
      | admin@example.com  | password | true  |           | true   |

    And there are the following dogs:
      | Sex  | Titles | Name                    | Birth Date | Owner             | Image      |
      | male |        | Samba y Fatiga Idilio   | 27/01/2006 | user1@example.com | perro.jpeg |
      | male |        | Fortunato Hautacuperche | 15/05/2008 | user2@example.com |            |
      | male |        | Frael Valderrama        | 01/01/2001 | user3@example.com |            |

    And there are the following results:
      | exhibition | award | dog | status    |
      | 1          | 8     | 1   | Pending   |
      | 2          | 8     | 2   | Rejected  |
      | 3          | 8     | 1   | Validated |
      | 1          | 8     | 3   | Pending   |
      | 2          | 8     | 3   | Rejected  |
      | 3          | 8     | 3   | Validated |

    And I am on the dogs page

  Scenario: Deleting a Pending result like an admin
    When I am signed in as "admin@example.com"
    And I follow "Results"
    And I follow "Delete" within "#result_1"
    Then I should see "Result has been deleted."


  Scenario: Deleting a Rejected result like an admin
    When I am signed in as "admin@example.com"
    And I follow "Results"
    And I follow "Delete" within "#result_2"
    Then I should see "Result has been deleted."

  Scenario: Deleting a Validated result like an admin
    When I am signed in as "admin@example.com"
    And I follow "Results"
    And I follow "Delete" within "#result_3"
    Then I should see "Result has been deleted."

  Scenario: Deleting a Pending result like a cahoot user
    When I am signed in as "user1@example.com"
    And I follow "My results"
    And I follow "Delete" within "#result_1"
    Then I should see "Result has been deleted"
  @working
  Scenario: Deleting a Rejected result like a cahoot user
    When I am signed in as "user2@example.com"
    And I follow "My results"
    And I follow "Delete" within "#result_1"