Feature: Deleting users
  In order to remove needless users
  As an admin
  I want to make them disappear

  Background:
    Given there are the following users:
      | email             | password | admin |
      | user1@example.com | password | false |
      | user2@example.com | password | false |
      | admin@example.com | password | true  |

    Given there are the following dogs:
      | Sex  | Titles | Name                    | Birth Date | Owner             |
      | male |        | Samba y Fatiga Idilio   | 27/01/2006 | user1@example.com |
      | male |        | Fortunato Hautacuperche | 15/05/2008 | user2@example.com |

    When I am signed in as "admin@example.com"
    And I am on the users page

  Scenario: Deleting a user like admin
    When I follow "Delete" within "#user_1"
    Then I should see "User has been deleted."
    And I should not see "user1@example.com"
    And "Samba y Fatiga Idilio" is not deleted