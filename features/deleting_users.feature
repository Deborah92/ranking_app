Feature: Deleting users
  In order to remove needless users
  As an admin
  I want to make them disappear

  Background:
    Given there are the following users:
      | email             | password | admin | image     |
      | user1@example.com | password | false | user.jpeg |
      | user2@example.com | password | false |           |
      | admin@example.com | password | true  |           |

    Given there are the following dogs:
      | Sex  | Titles | Name                    | Birth Date | Owner             | Image      |
      | male |        | Samba y Fatiga Idilio   | 27/01/2006 | user1@example.com | perro.jpeg |
      | male |        | Fortunato Hautacuperche | 15/05/2008 | user2@example.com |            |

    When I am signed in as "admin@example.com"
    And I am on the dogs page
    And I follow "Administrar Usuarios"

  Scenario: Deleting a user like an admin
    When I follow "Delete" within "#user_1"
    Then I should see "User has been deleted."
    And I should not see "user1@example.com"
    And "Samba y Fatiga Idilio" is not deleted

  Scenario: Users cannot delete themselves
    When I follow "Delete" within "#user_3"
    Then I should see "You cannot delete yourself"