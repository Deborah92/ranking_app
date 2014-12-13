Feature: Editing Results
  In order to update result information
  As an admin
  I want to be able to do that through an interface

  Background:
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

    Given there are the following exhibitions:
      | name         | date       | type                 |
      | exhibition 1 | 27/03/2014 | MONOGRÁFICA NACIONAL |
      | exhibition 2 | 15/07/2015 | Punto Obligatorio    |

    Given there are the following results:
      | exhibition | award | dog | status  |
      | 1          | 8     | 1   | Pending |

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


    And I am on the dogs page

  Scenario: Updating a result like an admin
    When I am signed in as "admin@example.com"
    And I follow "Results"
    And I follow "Edit" within "#result_1"
    And I select "Validated" from "Status"
    And I press "Update Result"
    Then I should see "Result has been updated. A message with the result's link has been sent to user email address"