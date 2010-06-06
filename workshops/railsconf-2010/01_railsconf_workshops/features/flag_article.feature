Feature: As a visitor 
         I want to flag an article 
         So that it needs to be reviewed

  Scenario: Visitor edits an existing article
    Given the following state exists:
      | name   |
      | review |
    And the following article exists:
      | title | body |
      | title | body |
    When I go to the home page
    And I follow "View"
    And I follow "Flag Article"
    And I should see "Article was successfully flagged"
