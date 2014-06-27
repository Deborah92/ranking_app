Feature: Editing a user
  In order to change a user's detail
  As an user
  I want to be able to modify them through the backend

  Background:
    Given there are the following users:
      | email            | password |
      | user@example.com | password |
    And I am signed in as them
    Given I am on the homepage
    And I follow "Users"
    And I follow "user@example.com"
    And I follow "Edit User"

  Scenario: Updating a user's details
    When I fill in "email" with "edituser@example.com"
    And I press "Update User"
    Then I should see "User has been updated."
    When "edituser@example.com" opens the email with subject "Confirmation instructions"
    And they click the first link in the email
    When I am on the homepage
    And I follow "Users"
    Then I should see "edituser@example.com"
    Then I should not see "user@example.com"

  Scenario: Updating with an invalid email fails
    When I fill in "email" with "this is not a valid email address"
    And I press "Update User"
    Then I should see "User has not been updated"
    And I should see "Email is invalid"