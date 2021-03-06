Feature: Creating dogs
  In order to create a dog
  I want to create them easily
  Background:
    Given there are the following dogs:
      | Sex  | Titles | Name                    | Birth Date |
      | male |        | Samba y Fatiga Idilio   | 27/01/2006 |

    And I am on the dogs page
    When I follow "New Dog"


  Scenario: Creating a dog
    And I select "male" from "Sex"
    And I fill in "Titles" with "CH OF SPAIN"
    And I fill in "Name" with "Frael Valderrama"
    And I fill in "Birth date" with "01/01/2001"
    And I press "Create Dog"
    Then I should see "Dog has been created."
    And I should be on the dog page for "Frael Valderrama"

  Scenario: Creating a dog without sex
    And I fill in "Titles" with "CH OF SPAIN"
    And I fill in "Name" with "Frael Valderrama"
    And I fill in "Birth date" with "01/01/2001"
    And I press "Create Dog"
    Then I should see "Sex is not included in the list"

  Scenario: Creating a dog without name
    And I select "male" from "Sex"
    And I fill in "Titles" with "CH OF SPAIN"
    And I fill in "Birth date" with "01/01/2001"
    And I press "Create Dog"
    Then I should see "Name can't be blank"

  Scenario: Creating a dog without birth date
    And I select "male" from "Sex"
    And I fill in "Titles" with "CH OF SPAIN"
    And I fill in "Name" with "Frael Valderrama"
    And I press "Create Dog"
    Then I should see "Birth date can't be blank"

  Scenario: Creating a dog with birth date in the future
    And I select "male" from "Sex"
    And I fill in "Titles" with "CH OF SPAIN"
    And I fill in "Birth date" with "1/1/2016"
    And I fill in "Name" with "Frael Valderrama"
    And I press "Create Dog"
    Then I should see "Birth date can not be in the future"

  Scenario: Creating a dog with an invalid birth date format
    And I select "male" from "Sex"
    And I fill in "Titles" with "CH OF SPAIN"
    And I fill in "Birth date" with "1/15/2002"
    And I fill in "Name" with "Frael Valderrama"
    And I press "Create Dog"
    Then I should see "Birth date must be a valid date"