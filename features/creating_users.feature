Feature: Editing Users
  In order to create a user
  As a user
  I want to create them easily

  Background:
    Given there are the following users:
      | email              | password | admin |
      | user1@example.com  | password | false |
      | user2@example.com  | password | false |
      | admin@example.com  | password | true  |

    And I am signed in as "admin@example.com"
    And I am on the users page


  Scenario: Updating a dog with property
    When I follow "New User"
    And I fill in "Email" with "user3@example.com"
    And I fill in "Password" with "password"
    And I fill in "Password confirmation" with "password"
    And I press "Create User"
    Then I should see "A message with a confirmation link has been sent to your email address. Please open the link to activate your account."
