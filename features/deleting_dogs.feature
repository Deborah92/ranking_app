Feature: Deleting dogs
  In order to remove needless dogs
  As a user
  I want to make them disappear

  Background:
    Given there are the following users:
      | email            | password |
      | user1@example.com | password |
      | user2@example.com | password |

    And there are the following dogs:
      | Sex  | Titles | Name                    | Birth Date | Owner             |
      | male |        | Samba y Fatiga Idilio   | 27/01/2006 | user1@example.com |
      | male |        | Fortunato Hautacuperche | 15/05/2008 | user2@example.com |

    And I am signed in as "user1@example.com"

  Scenario: Deleting dogs
    And I am on the dogs page
    When I follow "Delete" within "#dog_1"
    Then I should see "Dog has been deleted."
    Then I should not see "Samba y Fatiga Idilio"