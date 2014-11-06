Feature: Deleting dogs
  In order to remove needless dogs
  As a user
  I want to make them disappear

  Background:
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

    And I am on the dogs page

  Scenario: Deleting a dog with property like a cahoot user
    When I am signed in as "user1@example.com"
    And I follow "Delete" within "#dog_1"
    Then I should see "Dog has been deleted."
    Then I should not see "Samba y Fatiga Idilio"

  Scenario: Deleting a dog without property like a cahoot user
    When I am signed in as "user1@example.com"
    And I follow "Delete" within "#dog_2"
    Then I should see "You are not authorized to access this page"

  Scenario: Deleting a dog with property like a registered user
    When I am signed in as "user3@example.com"
    And I follow "Delete" within "#dog_3"
    Then I should see "You are not authorized to access this page"

  Scenario: Deleting a dog without property like a registered user
    When I am signed in as "user3@example.com"
    And I follow "Delete" within "#dog_1"
    Then I should see "You are not authorized to access this page"

  Scenario: Deleting a dog like admin
    When I am signed in as "admin@example.com"
    And I follow "Delete" within "#dog_1"
    Then I should see "Dog has been deleted."
    Then I should not see "Samba y Fatiga Idilio"