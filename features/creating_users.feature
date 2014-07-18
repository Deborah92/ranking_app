Feature: Creating Users
  In order to add new users to the system
  As I user
  I want to be able to add them through the backend

  Background:
    Given there are the following users:
      | email            | password |
      | user@example.com | password |

    And I am signed in as them
    Given I am on the homepage
    And I follow "Users"
    When I follow "New User"

  Scenario: Creating a new user
    And I fill in "email" with "newuser@example.com"
    And I fill in "password" with "password"
    And I press "Create User"
    Then I should see "User has been created"

  Scenario: Leaving email blank results in an error
    When I fill in "email" with ""
    And I fill in "password" with "password"
    And I press "Create User"
    Then I should see "User has not been created"
    And I should see "email can't be blank"