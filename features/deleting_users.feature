Feature: Deleting users
  In order to remove users
  As an user
  I want to click a button and delete them

  Background:
    Given there are the following users:
      | email              | password |
      | user@ticketee.com  | password |

    And I am signed in as them
    Given I am on the user page

  Scenario: Deleting an user
    And I follow "user@example.com"
    When I follow "Delete User"
    Then I should see "User has been deleted"

  Scenario: User cannot delete themselves
    When I follow "user@example.com"
    And I follow "Delete User"
    Then I should see "You cannot delete yourself"
