Feature: Signing out
  IIn order to go out the site
  As a user
  I want to be able to sign out

  @working
  Scenario: Signing out
    Given there are the following users:
      | email            | password |
      | user@example.com | password |
    And I am signed in as "user@example.com"
    And I am on the dogs page
    And I follow "Sign out"
    Then I should see "Signed out successfully"