Feature: Editing Exhibitions
  In order to update exhibition information
  As an admin
  I want to be able to do that through an interface

  Background:
    Given there are the following types:
      | name                                     |
      | MONOGRÁFICA NACIONAL                     |
      | CONCURSO MONOGRÁFICO NACIONAL O REGIONAL |
      | Especial A.E.F.R.B.F.                    |
      | Punto Obligatorio                        |
      | EXPOSICIÓN INTERNACIONAL                 |
      | EXPOSICIÓN NACIONAL                      |

    Given there are the following exhibitions:
      | name         | date       | type                 |
      | exhibition 1 | 27/03/2015 | MONOGRÁFICA NACIONAL |
      | exhibition 2 | 15/07/2015 | Punto Obligatorio    |

    Given there are the following users:
      | email              | password | admin | image     | cahoot |
      | user1@example.com  | password | false | user.jpeg | true   |
      | user2@example.com  | password | false |           | true   |
      | user3@example.com  | password | false |           | false  |
      | admin@example.com  | password | true  |           | true   |

    And I am on the dogs page

  Scenario: Updating an exhibition like an admin
    When I am signed in as "admin@example.com"
    And I follow "Exhibitions"
    And I follow "Edit" within "#exhibition_1"
    And I fill in "Name" with "exhibition beta 1"
    And I press "Update Exhibition"
    Then I should see "Exhibition has been updated."
    And I should see "exhibition beta 1"
    And I should not see "exhibition 1"

  Scenario: Updating an exhibition without name
    When I am signed in as "admin@example.com"
    And I follow "Exhibitions"
    And I follow "Edit" within "#exhibition_1"
    And I fill in "Name" with ""
    And I press "Update Exhibition"
    Then I should see "Exhibition has not been updated."
    And I should see "Name can't be blank"

  Scenario: Updating an exhibition without date
    When I am signed in as "admin@example.com"
    And I follow "Exhibitions"
    And I follow "Edit" within "#exhibition_1"
    And I click in "Date"
    And I fill in "datepicker" with ""
    And I press "Update Exhibition"
    Then I should see "Exhibition has not been updated."
    And I should see "Date can't be blank"
