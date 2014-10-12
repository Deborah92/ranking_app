Feature: Editing Users
  In order to update user information
  As an user
  I want to be able to do that through an interface

  Background:
    Given there are the following users:
      | email              | password | admin |
      | user1@example.com  | password | false |
      | user2@example.com  | password | false |
      | admin@example.com  | password | true  |

    And I am on the dogs page

  Scenario: Updating a user's details like an admin
    When I am signed in as "admin@example.com"
    And I follow "Administrar Usuarios"
    And I follow "Edit" within "#user_1"
    And I fill in "Email" with "user1beta@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Update User"
    Then I should see "User has been updated."
    And I should see "user1beta@example.com"
    And I should not see "user1@example.com"

  Scenario: Toggling a user's admin ability like an admin
    When I am signed in as "admin@example.com"
    And I follow "Administrar Usuarios"
    And I follow "Edit" within "#user_1"
    And I fill in "Email" with "user1@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I check "Is an admin?"
    And I press "Update User"
    Then I should see "User has been updated."
    And I follow "Administrar Usuarios"
    And I should see "user1@example.com (Admin)"
    And I should not see "user1@example.com (User)"

  Scenario: Updating a user's details like own user
    When I am signed in as "user1@example.com"
    And I follow "Mi perfil"
    And I follow "Edit User"
    And I fill in "Email" with "user1beta@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Update User"
    Then I should see "User has been updated."
    And I should see "user1beta@example.com"
    And I should not see "user1@example.com"

  Scenario: Updating with an invalid email fails like an admin
    When I am signed in as "admin@example.com"
    And I follow "Administrar Usuarios"
    And I follow "Edit" within "#user_1"
    And I fill in "Email" with "fakefakefake"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Update User"
    Then I should see "User has not been updated."
    And I should see "Email is invalid"


  Scenario: Updating with an invalid email fails like own user
    When I am signed in as "user1@example.com"
    And I follow "Mi perfil"
    And I follow "Edit User"
    And I fill in "Email" with "fakefakefake"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Update User"
    Then I should see "User has not been updated."
    And I should see "Email is invalid"
