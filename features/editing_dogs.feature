Feature: Editing Dogs
  In order to update dog information
  As a user
  I want to be able to do that through an interface

  Background:
    Given there are the following users:
      | email             | password |
      | user1@example.com  | password |
      | user2@example.com  | password |

    And there are the following dogs:
      | Sex  | Titles | Name                    | Birth Date | Owner             |
      | male |        | Samba y Fatiga Idilio   | 27/01/2006 | user1@example.com |
      | male |        | Fortunato Hautacuperche | 15/05/2008 | user2@example.com |

    And I am signed in as "user1@example.com"
    And I am on the dogs page


  Scenario: Updating a dog with property
    When I follow "Edit" within "#dog_1"
    And I fill in "Name" with "Samba y Fatiga Idilio beta"
    And I press "Update Dog"
    Then I should see "Dog has been updated."
    Then I should be on the dog page for "Samba y Fatiga Idilio beta"

  @working
  Scenario: Updating a dog without property
    When I follow "Edit" within "#dog_2"
    Then I should see "You are not authorized to access this page"

  Scenario: Updating a dog without name
    When I follow "Edit" within "#dog_1"
    And I fill in "Name" with " "
    And I press "Update Dog"
    Then I should see "Name can't be blank"

  Scenario: Updating a dog without birth date
    When I follow "Edit" within "#dog_1"
    And I click in "Birth date"
    And I fill in "datepicker" with ""
    And I press "Update Dog"
    Then I should see "Birth date can't be blank"

  Scenario: Updating a dog with birth date in the future
    When I follow "Edit" within "#dog_1"
    And I click in "Birth date"
    And I fill in "datepicker" with "1/1/2016"
    And I press "Update Dog"
    Then I should see "Birth date can not be in the future"

#  Scenario: Updating a dog with an invalid birth date format
#    When I follow "Edit" within "#dog_1"
#    And I click in "Birth date"
#    And I fill in "datepicker" with "1/15/2002"
#    And I press "Update Dog"
#    Then I should see "Birth date must be a valid date"