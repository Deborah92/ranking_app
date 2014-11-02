Feature: Deleting results
  In order to remove needless result
  As a user
  I want to make them disappear

  Background:
    Given there are the following results:
      | exhibition   | award         | dog                     | status    |
      | exhibition 1 | BOS           | Samba y Fatiga Idilio   | Pending   |
      | exhibition 2 | MEJOR DE RAZA | Fortunato Hautacuperche | Validated |
      | exhibition 3 | CAC           | Samba y Fatiga Idilio   | Validated |

    And there are the following users:
      | email             | password | admin |
      | user1@example.com | password | false |
      | user2@example.com | password | false |
      | admin@example.com | password | true  |

    And I am on the dogs page

  Scenario: Deleting a result like an admin
    When I am signed in as "admin@example.com"
    And I follow "Administrar Resultados"
    And I follow "Delete" within "#result_1"
    Then I should see "Result has been deleted."

  Scenario: Deleting a result like a user with properties
    When I am signed in as "user1@example.com"
    And I follow "My Results"
    And Save and open page
    And I follow "Delete" within "#result_1"
    Then I should see "Result has been deleted"

#  Scenario: Deleting a Validated result like a user
#    When I am signed in as "user1@example.com"
#    And I follow "My Results"
#    And Save and open page
#    And I follow "Delete" within "#result_3"
#    Then I should see "Result has not been deleted. "