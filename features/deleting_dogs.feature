Feature: Deleting dogs
  In order to remove needless dogs
  As a user
  I want to make them disappear

  Background:
    Given there are the following users:
      | email             | password | admin | image     |
      | user1@example.com | password | false | user.jpeg |
      | user2@example.com | password | false |           |
      | admin@example.com | password | true  |           |

    And there are the following dogs:
      | Sex  | Titles | Name                    | Birth Date | Owner             | Image      |
      | male |        | Samba y Fatiga Idilio   | 27/01/2006 | user1@example.com | perro.jpeg |
      | male |        | Fortunato Hautacuperche | 15/05/2008 | user2@example.com |            |

    And I am on the dogs page

  Scenario: Deleting a dog with property
    When I am signed in as "user1@example.com"
    And I follow "Delete" within "#dog_1"
    Then I should see "Dog has been deleted."
    Then I should not see "Samba y Fatiga Idilio"

  Scenario: Deleting a dog without property
    When I am signed in as "user1@example.com"
    And I follow "Delete" within "#dog_2"
    Then I should see "You are not authorized to access this page"

  Scenario: Deleting a dog like admin
    When I am signed in as "admin@example.com"
    And I follow "Delete" within "#dog_1"
    Then I should see "Dog has been deleted."
    Then I should not see "Samba y Fatiga Idilio"