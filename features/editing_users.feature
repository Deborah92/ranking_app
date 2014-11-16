Feature: Editing Users
  In order to update user information
  As an user
  I want to be able to do that through an interface

  Background:
    Given there are the following users:
      | email              | password | admin | image     | cahoot |
      | user1@example.com  | password | false | user.jpeg | true   |
      | user2@example.com  | password | false |           | true   |
      | user3@example.com  | password | false |           | false  |
      | admin@example.com  | password | true  |           | true   |

    And I am on the dogs page

  Scenario: Updating a user's details like an admin
    When I am signed in as "admin@example.com"
    And I follow "Users management"
    And I follow "Edit" within "#user_1"
    And I attach the file "images/user/user.jpeg" to "Image"
    And I fill in "Email" with "user1beta@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Update User"
    Then I should see "User has been updated."
    And I should see "user1beta@example.com"
    And I should not see "user1@example.com"

  Scenario: Toggling a user's admin ability like an admin
    When I am signed in as "admin@example.com"
    And I follow "Users management"
    And I follow "Edit" within "#user_1"
    And I fill in "Email" with "user1@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I check "Is an admin?"
    And I press "Update User"
    Then I should see "User has been updated."
    And I follow "Users management"
    And I should see "user1@example.com (Admin)"
    And I should not see "user1@example.com (User)"

  Scenario: Toggling a user's cahoot ability like an admin
    When I am signed in as "admin@example.com"
    And I follow "Users management"
    And I follow "Edit" within "#user_3"
    And I fill in "Email" with "user3@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I check "Is a cahoot?"
    And I press "Update User"
    Then I should see "User has been updated."
    And I follow "Users management"
    And I should see "user3@example.com (User) (Cahoot)"

  Scenario: Updating a user's details like own user cahoot
    When I am signed in as "user1@example.com"
    And I follow "My profile"
    And I follow "Edit User"
    And I attach the file "images/user/user.jpeg" to "Image"
    And I fill in "Email" with "user1beta@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Update User"
    Then I should see "User has been updated."
    And I should see "user1beta@example.com"
    And I should not see "user1@example.com"

  Scenario: Updating a user's details like own user registered
    When I am signed in as "user3@example.com"
    And I follow "My profile"
    And I follow "Edit User"
    And I attach the file "images/user/user.jpeg" to "Image"
    And I fill in "Email" with "user3beta@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Update User"
    Then I should see "User has been updated."
    And I should see "user3beta@example.com"
    And I should not see "user3@example.com"

  Scenario: Updating with an invalid email fails like an admin
    When I am signed in as "admin@example.com"
    And I follow "Users management"
    And I follow "Edit" within "#user_1"
    And I fill in "Email" with "fakefakefake"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Update User"
    Then I should see "User has not been updated."
    And I should see "Email is invalid"


  Scenario: Updating with an invalid email fails like own user
    When I am signed in as "user1@example.com"
    And I follow "My profile"
    And I follow "Edit User"
    And I fill in "Email" with "fakefakefake"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Update User"
    Then I should see "User has not been updated."
    And I should see "Email is invalid"
