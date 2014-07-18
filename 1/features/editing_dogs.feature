Feature: Editing Dogs
  In order to update dog information
  I want to be able to do that through an interface

  Background:
    Given there are the following dogs:
      | Sex  | Titles | Name                    | Birth Date |
      | male |        | Samba y Fatiga Idilio   | 27/01/2006 |
      | male |        | Fortunato Hautacuperche | 15/05/2008 |

    And I am on the homepage
    When I follow "Samba y Fatiga Idilio"
    When I follow "Edit Dog"

  Scenario: Updating a dog
    And I fill in "Name" with "Samba y Fatiga Idilio beta"
    And I press "Update Dog"
    Then I should see "Dog has been updated."
    Then I should be on the dog page for "Samba y Fatiga Idilio beta"

  Scenario: Updating a dog without name
    And I fill in "Name" with " "
    And I press "Update Dog"
    Then I should see "Name can't be blank"

  Scenario: Updating a dog without birth date
    And I fill in "Birth date" with ""
    And I press "Update Dog"
    Then I should see "Birth date can't be blank"

  Scenario: Updating a dog with birth date in the future
    And I fill in "Birth date" with "1/1/2016"
    And I press "Update Dog"
    Then I should see "Birth date can not be in the future"

  Scenario: Updating a dog with an invalid birth date format
    And I fill in "Birth date" with "1/15/2002"
    And I press "Update Dog"
    Then I should see "Birth date must be a valid date"