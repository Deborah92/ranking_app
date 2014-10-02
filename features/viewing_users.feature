Feature: Viewing users
  In order to view the users
  As an admin
  I want to see them on that user's page

  Background:
    Given there are the following users:
      | email             | password | admin |
      | user1@example.com | password | false |
      | user2@example.com | password | false |
      | admin@example.com | password | true  |

    And I am on the dogs page

  Scenario: Viewing users like admin
    When I am signed in as "admin@example.com"
    And I follow "Administrar Usuarios"
    Then I should see "user1@example.com"
    And I should see "user2@example.com"
    And I should see "admin@example.com"

  Scenario: Viewing users like not admin user
    When I am signed in as "user1@example.com"
    And I follow "Administrar Usuarios"
    Then I should see "You are not authorized to access this page."