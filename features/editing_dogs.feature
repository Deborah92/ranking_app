Feature: Editing Dogs
  In order to update dog information
  As a user
  I want to be able to do that through an interface

  Background:
    Given there are the following users:
      | email              | password | admin | image     | cahoot |
      | user1@example.com  | password | false | user.jpeg | true   |
      | user2@example.com  | password | false |           | true   |
      | user3@example.com  | password | false |           | false  |
      | admin@example.com  | password | true  |           | true   |

    And there are the following dogs:
      | Sex  | Titles | Name                    | Birth Date | Owner             | Image      |
      | male |        | Samba y Fatiga Idilio   | 27/01/2006 | user1@example.com | perro.jpeg |
      | male |        | Fortunato Hautacuperche | 15/05/2008 | user2@example.com |            |
      | male |        | Frael Valderrama        | 01/01/2001 | user3@example.com |            |

    And I am on the dogs page


  Scenario: Updating a dog with property like a cahoot user
    And I am signed in as "user1@example.com"
    When I follow "Edit" within "#dog_1"
    And I fill in "Name" with "Samba y Fatiga Idilio beta"
    And I attach the file "images/dog/perro.jpeg" to "Image"
    And I press "Update Dog"
    Then I should see "Dog has been updated."
    And I should be on the dog page for "Samba y Fatiga Idilio beta"

  Scenario: Updating a dog for admin
    When I am signed in as "admin@example.com"
    When I follow "Edit" within "#dog_1"
    And I fill in "Name" with "Samba y Fatiga Idilio beta"
    And I press "Update Dog"
    Then I should see "Dog has been updated."
    Then I should be on the dog page for "Samba y Fatiga Idilio beta"

  Scenario: Updating a dog without name
    And I am signed in as "user1@example.com"
    When I follow "Edit" within "#dog_1"
    And I fill in "Name" with " "
    And I press "Update Dog"
    Then I should see "Name can't be blank"

  Scenario: Updating a dog without birth date
    And I am signed in as "user1@example.com"
    When I follow "Edit" within "#dog_1"
    And I click in "Birth date"
    And I fill in "datepicker" with ""
    And I press "Update Dog"
    Then I should see "Birth date can't be blank"

  Scenario: Updating a dog with birth date in the future
    And I am signed in as "user1@example.com"
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