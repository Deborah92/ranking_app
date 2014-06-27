Feature: Viewing dogs
  In order to view the dogs
  As a guest
  I want to see them on that dog's page

  Background:
    Given there are the following dogs:
      | Sex  | Titles | Name                    | Birth Date |
      | male |        | Samba y Fatiga Idilio   | 27/01/2006 |
      | male |        | Fortunato Hautacuperche | 15/05/2008 |

    And there are the following users:
      | email             | password |
      | user@ticketee.com | password |

    And I am signed in as them

  Scenario: Viewing dogs
    When I am on the dogs page
    Then I should see "Samba y Fatiga Idilio"
    And I should see "Fortunato Hautacuperche"