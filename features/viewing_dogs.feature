Feature: Viewing dogs
  In order to view the dogs
  I want to see them on that dog's page

  Background:
    Given there are the following users:
      | email             | password |
      | user@example.com  | password |


    And "user@example.com" is the owner of the following dogs:
      | Sex  | Titles | Name                    | Birth Date |
      | male |        | Samba y Fatiga Idilio   | 27/01/2006 |
      | male |        | Fortunato Hautacuperche | 15/05/2008 |

  Scenario: Viewing dogs
    When I am on the dogs page
    Then I should see "Samba y Fatiga Idilio"
    And I should see "Fortunato Hautacuperche"
    And I should see "user@example.com"