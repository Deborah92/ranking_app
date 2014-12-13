Feature: Creating exhibitions
  In order to create an exhibition
  As an admin
  I want to create them easily
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

    Given there are the following users:
      | email              | password | admin | image     | cahoot |
      | user1@example.com  | password | false | user.jpeg | true   |
      | user2@example.com  | password | false |           | true   |
      | user3@example.com  | password | false |           | false  |
      | admin@example.com  | password | true  |           | true   |

    And I am on the dogs page

  Scenario: Creating an exhibition like an admin
    When I am signed in as "admin@example.com"
    And I follow "Exhibitions"
    And I follow "New Exhibition"
    And I fill in "Name" with "exhibition 2"
    And I click in "Date"
    And I fill in "datepicker" with "15/06/2015"
    And I select "MONOGRÁFICA NACIONAL" from "Type"
    And I press "Create Exhibition"
    Then I should see "Exhibition has been created."
    And I should see "exhibition 2"

  Scenario: Creating an exhibition without name
    When I am signed in as "admin@example.com"
    And I follow "Exhibitions"
    And I follow "New Exhibition"
    And I fill in "Name" with ""
    And I click in "Date"
    And I fill in "datepicker" with "15/06/2015"
    And I select "MONOGRÁFICA NACIONAL" from "Type"
    And I press "Create Exhibition"
    Then I should see "Exhibition has not been created."
    And I should see "Name can't be blank"

  Scenario: Creating an exhibition without date
    When I am signed in as "admin@example.com"
    And I follow "Exhibitions"
    And I follow "New Exhibition"
    And I fill in "Name" with "exhibition 2"
    And I click in "Date"
    And I fill in "datepicker" with ""
    And I select "MONOGRÁFICA NACIONAL" from "Type"
    And I press "Create Exhibition"
    Then I should see "Exhibition has not been created."
    And I should see "Date can't be blank"

  Scenario: Creating an exhibition without type
    When I am signed in as "admin@example.com"
    And I follow "Exhibitions"
    And I follow "New Exhibition"
    And I fill in "Name" with "exhibition 2"
    And I click in "Date"
    And I fill in "datepicker" with "15/06/2015"
    And I select "Type..." from "Type"
    And I press "Create Exhibition"
    Then I should see "Exhibition has not been created."
    And I should see "Type can't be blank"