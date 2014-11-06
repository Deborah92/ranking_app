Feature: Viewing dogs
  In order to view the dogs
  I want to see them on that dog's page

  Background:
    Given there are the following users:
      | email              | password | admin | image     | cahoot |
      | user1@example.com  | password | false | user.jpeg | true   |
      | user2@example.com  | password | false |           | true   |
      | user3@example.com  | password | false |           | false  |
      | admin@example.com  | password | true  |           | true   |


    And "user1@example.com" is the owner of the following dogs:
      | Sex  | Titles | Name                    | Birth Date | Image      |
      | male |        | Samba y Fatiga Idilio   | 27/01/2006 | perro.jpeg |
      | male |        | Fortunato Hautacuperche | 15/05/2008 |            |


    And I am on the dogs page

  Scenario: Viewing dogs like an admin
    When I am signed in as "admin@example.com"
    Then I should see "Samba y Fatiga Idilio"
    And I should see "Fortunato Hautacuperche"
    And I should see "admin@example.com"

  Scenario: Viewing dogs like a cahoot user
    When I am signed in as "user1@example.com"
    Then I should see "Samba y Fatiga Idilio"
    And I should see "Fortunato Hautacuperche"
    And I should see "user1@example.com"

  Scenario: Viewing dogs like a registered user
    When I am signed in as "user3@example.com"
    Then I should see "Samba y Fatiga Idilio"
    And I should see "Fortunato Hautacuperche"
    And I should see "user3@example.com"