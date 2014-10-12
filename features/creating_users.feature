Feature: Creating Users
  In order to create a user
  As an admin
  I want to create them easily

  Background:
    Given there are the following users:
      | email              | password | admin |
      | user1@example.com  | password | false |
      | user2@example.com  | password | false |
      | admin@example.com  | password | true  |

    And I am signed in as "admin@example.com"
    And I am on the users page


  Scenario: Creating a user
    When I follow "New User"
    And I fill in "Email" with "user3@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Create User"
    Then I should see "User has been created"
    And I should see "user3@example.com (User)"

  Scenario: Creating an admin user
    When I follow "New User"
    When I fill in "Email" with "admin2@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I check "Is an admin?"
    And I press "Create User"
    Then I should see "User has been created."
    And I should see "admin2@example.com (Admin)"

  Scenario: Creating a user without password
    When I follow "New User"
    And I fill in "Email" with "user3@example.com"
    And I press "Create User"
    Then I should see "User has not been created"
    And I should see "Password can't be blank"

  Scenario: Creating a user without email
    When I follow "New User"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Create User"
    Then I should see "User has not been created"
    And I should see "Email can't be blank"

  Scenario: Creating a user with a different password and confirmation password
    When I follow "New User"
    And I fill in "Email" with "user3@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "pasword"
    And I press "Create User"
    Then I should see "User has not been created"
    And I should see "Password confirmation doesn't match Password"