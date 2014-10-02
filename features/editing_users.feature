Feature: Editing Users
  In order to update user information
  As a user
  I want to be able to do that through an interface

  Background:
    Given there are the following users:
      | email              | password | admin |
      | user1@example.com  | password | false |
      | user2@example.com  | password | false |
      | admin@example.com  | password | true  |

    And I am signed in as "admin@example.com"
    And I am on the users page


  Scenario: Updating a dog with property
    When I follow "Edit" within "#user_1"
    And I fill in "Email" with "user1beta@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Update User"
    Then I should see "User has been updated."
    And Save and open page
    Then I should be on the user page for "user1beta@example.com"
