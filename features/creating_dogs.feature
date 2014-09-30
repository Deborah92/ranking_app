Feature: Creating dogs
  In order to create a dog
  As a user
  I want to create them easily
  Background:
    Given there are the following dogs:
      | Sex  | Titles | Name                    | Birth Date | Owner             |
      | male |        | Samba y Fatiga Idilio   | 27/01/2006 | user1@example.com |

    Given there are the following users:
      | email             | password | admin |
      | user@example.com  | password | false |
      | admin@example.com | password | true  |

    And I am on the dogs page

  @working
  Scenario: Creating a dog
    When I am signed in as "user@example.com"
    And I follow "New Dog"
    And I select "male" from "Sex"
    And I fill in "Titles" with "CH OF SPAIN"
    And I fill in "Name" with "Frael Valderrama"
    And I click in "Birth date"
    And I fill in "datepicker" with "01/01/2001"
    And I press "Create Dog"
    Then I should see "Dog has been created."
    And  I should see "Owned by user@example.com"
    And I should be on the dog page for "Frael Valderrama"

  Scenario: Creating a dog for admin
    When I am signed in as "admin@example.com"
    And I follow "New Dog"
    And I select "male" from "Sex"
    And I fill in "Titles" with "CH OF SPAIN"
    And I fill in "Name" with "Frael Valderrama"
    And I click in "Birth date"
    And I fill in "datepicker" with "01/01/2001"
    And I press "Create Dog"
    Then I should see "Dog has been created."
    And  I should see "Owned by admin@example.com"
    And I should be on the dog page for "Frael Valderrama"

  Scenario: Creating a dog without sex
    When I am signed in as "user@example.com"
    And I follow "New Dog"
    And I fill in "Titles" with "CH OF SPAIN"
    And I fill in "Name" with "Frael Valderrama"
    And I click in "Birth date"
    And I fill in "datepicker" with "01/01/2001"
    And I press "Create Dog"
    Then I should see "Sex is not included in the list"

  Scenario: Creating a dog without name
    When I am signed in as "user@example.com"
    And I follow "New Dog"
    And I select "male" from "Sex"
    And I fill in "Titles" with "CH OF SPAIN"
    And I click in "Birth date"
    And I fill in "datepicker" with "01/01/2001"
    And I press "Create Dog"
    Then I should see "Name can't be blank"

  Scenario: Creating a dog without birth date
    When I am signed in as "user@example.com"
    And I follow "New Dog"
    And I select "male" from "Sex"
    And I fill in "Titles" with "CH OF SPAIN"
    And I fill in "Name" with "Frael Valderrama"
    And I press "Create Dog"
    Then I should see "Birth date can't be blank"

  Scenario: Creating a dog with birth date in the future
    When I am signed in as "user@example.com"
    And I follow "New Dog"
    And I select "male" from "Sex"
    And I fill in "Titles" with "CH OF SPAIN"
    And I click in "Birth date"
    And I fill in "datepicker" with "01/01/2016"
    And I fill in "Name" with "Frael Valderrama"
    And I press "Create Dog"
    Then I should see "Birth date can not be in the future"

  # Este test debe estar en RSPEC
#  Scenario: Creating a dog with an invalid birth date format
#    And I select "male" from "Sex"
#    And I fill in "Titles" with "CH OF SPAIN"
#    And I click in "Birth date"
#    And I fill in "datepicker" with "30/02/2002"
#    And I fill in "Name" with "Frael Valderrama"
#    And I press "Create Dog"
#    Then I should see "Birth date must be a valid date"