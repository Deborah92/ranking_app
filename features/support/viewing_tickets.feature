Feature: Viewing tickets
  In order to view the tickets for a project
  As a user
  I want to see them on that project's page

  Background:
    Given there are the following users:
      | email             | password |
      | user@ticketee.com | password |
    And I am signed in as them
    Given there is a project called "TextMate 2"
    And "user@ticketee.com" can view the "TextMate 2" project
    And "user@ticketee.com" has created a ticket for this project:
      | title          | description                   |
      | Make it shiny! | Gradients! Starbursts! Oh my! |
    Given there is a project called "Internet Explorer"
    And "user@ticketee.com" can view the "Internet Explorer" project
    And "user@ticketee.com" has created a ticket for this project:
      | title               | description       |
      | Standard compliance | It is not a joke. |

    Given I am on the homepage

  Scenario: Viewing tickets for a given projects
    When I follow "TextMate 2"
    Then I should see "Make it shiny!"
    And I should not see "Standard compliance"
    When I follow "Make it shiny!"
    Then I should see "Make it shiny!" within "#tickets h2"
    And I should see "Gradients! Starbursts! Oh my!"

    When I follow "Ticketee"
    And I follow "Internet Explorer"
    Then I should not see "Make it shiny!"
    And I should see "Standard compliance"
    When I follow "Standard compliance"
    Then I should see "Standard compliance" within "#tickets h2"
    And I should see "It is not a joke."