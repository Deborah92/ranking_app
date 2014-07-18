Feature: Deleting dogs
  In order to remove needless dogs
  I want to make them disappear

  Background:
    Given there are the following dogs:
      | Sex  | Titles | Name                    | Birth Date |
      | male |        | Samba y Fatiga Idilio   | 27/01/2006 |
      | male |        | Fortunato Hautacuperche | 15/05/2008 |

  Scenario: Deleting dogs
    And I am on the dogs page
    When I follow "Samba y Fatiga Idilio"
    And I press "Delete Dog"
    Then I should see "Dog has been deleted."
    Then I should not see "Samba y Fatiga Idilio"