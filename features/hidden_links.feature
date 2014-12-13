Feature: Creating dogs
  In order to create a dog
  As a user
  I want to create them easily
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

    Given there are the following users:
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
      | exhibition 1 | 27/03/2014 | MONOGRÁFICA NACIONAL |
      | exhibition 2 | 15/07/2014 | Punto Obligatorio    |
      | exhibition 3 | 12/03/2014 | EXPOSICIÓN NACIONAL  |

    And there are the following results:
      | exhibition | award | dog | status    |
      | 1          | 8     | 1   | Pending   |
      | 2          | 8     | 2   | Rejected  |
      | 3          | 8     | 1   | Validated |
      | 1          | 8     | 3   | Pending   |
      | 2          | 8     | 3   | Rejected  |
      | 3          | 8     | 3   | Validated |



    And I am on the dogs page

  Scenario: New dog link is hidden for registered users
    When I am signed in as "user3@example.com"
    And I follow "Dogs"
    Then I should not see the "New Dog" link

  Scenario: Exhibitions link is hidden for non-signed-in users
    Then I should not see the "Exhibitions" link

  Scenario: New exhibition link is hidden for cahoot users
    When I am signed in as "user1@example.com"
    And I follow "Exhibitions"
    Then I should not see the "New Exhibition" link

  Scenario: New exhibition link is hidden for registered users
    When I am signed in as "user3@example.com"
    And I follow "Exhibitions"
    Then I should not see the "New Exhibition" link

  Scenario: My results link is hidden for non-signed-in users
    Then I should not see the "My results" link

  Scenario: New result link is hidden for registered users
    When I am signed in as "user3@example.com"
    And I follow "My results"
    Then I should not see the "New Result" link

  Scenario: Users management link is hidden for non-signed-in users
    Then I should not see the "Users" link

  Scenario: Users management link is hidden for registered users
    When I am signed in as "user3@example.com"
    Then I should not see the "Users" link

  Scenario: Users management link is hidden for cahoot users
    When I am signed in as "user2@example.com"
    Then I should not see the "Users" link

  Scenario: Delete dog link is hidden for cahoot users without property
    When I am signed in as "user1@example.com"
    And I follow "Dogs"
    Then I should not see "Delete" within "#dog_2"

  Scenario: Delete dog link is hidden for registered users with property
    When I am signed in as "user3@example.com"
    And I follow "Dogs"
    Then I should not see "Delete" within "#dog_3"

  Scenario: Delete dog link is hidden for registered users without property
    When I am signed in as "user3@example.com"
    And I follow "Dogs"
    Then I should not see "Delete" within "#dog_1"

  Scenario: Delete an exhibition link is hidden for cahoot users
    When I am signed in as "user1@example.com"
    And I follow "Exhibitions"
    Then I should not see "Delete" within "#exhibition_1"

  Scenario: Delete an exhibition link is hidden for registered users
    When I am signed in as "user3@example.com"
    And I follow "Exhibitions"
    Then I should not see "Delete" within "#exhibition_1"

  Scenario: Delete a Pending result link for registered users
    When I am signed in as "user3@example.com"
    And I follow "My results"
    Then I should not see the "Delete" link

  Scenario: Delete a Rejected result link for registered users
    When I am signed in as "user3@example.com"
    And I follow "My results"
    Then I should not see the "Delete" link

  Scenario: Delete a Validated result link for registered users
    When I am signed in as "user3@example.com"
    And I follow "My results"
    Then I should not see the "Delete" link

  Scenario: Results management link is hidden for non-signed-in users
    Then I should not see the "Results" link

  Scenario: Results management link is hidden for registered users
    When I am signed in as "user3@example.com"
    Then I should not see the "Results" link

  Scenario: Results management link is hidden for cahoot users
    When I am signed in as "user2@example.com"
    Then I should not see the "Results" link

  Scenario: Edit a dog link for cahoot users without property
    And I am signed in as "user1@example.com"
    And I follow "Dogs"
    Then I should not see "Edit" within "#dog_2"

  Scenario: Edit a dog link for registered users with property
    And I am signed in as "user3@example.com"
    And I follow "Dogs"
    Then I should not see "Edit" within "#dog_3"

  Scenario: Edit a dog link for registered users  without property
    And I am signed in as "user3@example.com"
    And I follow "Dogs"
    Then I should not see "Edit" within "#dog_1"

  Scenario: Edit an exhibition for cahoot users
    When I am signed in as "user1@example.com"
    And I follow "Exhibitions"
    Then I should not see "Edit" within "#exhibition_1"

  Scenario: Edit an exhibition for registered users
    When I am signed in as "user3@example.com"
    And I follow "Exhibitions"
    Then I should not see "Edit" within "#exhibition_1"

  Scenario: Edit a result link for cahoot users
    When I am signed in as "user1@example.com"
    And I follow "My results"
    Then I should not see the "Edit" link

  Scenario: Edit a result link for registered users
    When I am signed in as "user3@example.com"
    And I follow "My results"
    Then I should not see the "Edit" link

  Scenario: Edit other user profile link for  non-signed-in users
    And I follow "Dogs"
    Then I should not see the "user2@example.com" link

  Scenario: Edit other user profile link for cahoot users
    When I am signed in as "user1@example.com"
    And I follow "Dogs"
    And I follow "user2@example.com"
    Then I should not see the "Edit User" link

  Scenario: Edit other user profile link for registered users
    When I am signed in as "user3@example.com"
    And I follow "Dogs"
    And I follow "user2@example.com"
    Then I should not see the "Edit User" link



