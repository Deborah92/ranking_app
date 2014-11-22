Feature: Creating dogs
  In order to create a dog
  As a user
  I want to create them easily
  Background:
    Given there are the following dogs:
      | Sex  | Titles | Name                    | Birth Date | Owner             | Image      |
      | male |        | Samba y Fatiga Idilio   | 27/01/2006 | user1@example.com | perro.jpeg |

    Given there are the following users:
      | email              | password | admin | image     | cahoot |
      | user1@example.com  | password | false | user.jpeg | true   |
      | user2@example.com  | password | false |           | true   |
      | user3@example.com  | password | false |           | false  |
      | admin@example.com  | password | true  |           | true   |

    And I am on the dogs page

  Scenario: New dog link is hidden for non-signed-in users
    Then I should not see the "New Dog" link

  Scenario: New dog link is hidden for registered users
    When I am signed in as "user3@example.com"
    Then I should not see the "New Dog" link

  Scenario: Exhibitions link is hidden for non-signed-in users
    Then I should not see the "Exhibitions" link

  Scenario: New exhibition link is hidden for cahoot users
    When I am signed in as "user1@example.com"
    And I follow "Exhibitions"
    Then I should not see the "New Exhibition" link

  Scenario: New exhibition link is hidden for registered users
    When I am signed in as "user3@example.com"
    And I follow "Exhibitions"
    Then I should not see the "New Exhibition" link

  Scenario: My results link is hidden for non-signed-in users
    Then I should not see the "My results" link

  Scenario: New result link is hidden for registered users
    When I am signed in as "user3@example.com"
    And I follow "My results"
    Then I should not see the "New Result" link

  Scenario: Users management link is hidden for non-signed-in users
    Then I should not see the "Users management" link

  Scenario: Users management link is hidden for registered users
    When I am signed in as "user3@example.com"
    Then I should not see the "Users management" link

  Scenario: Users management link is hidden for cahoot users
    When I am signed in as "user2@example.com"
    Then I should not see the "Users management" link