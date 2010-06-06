Feature: As a visitor I want to edit an article so that I can refine articles

  Scenario: Visitor edits an existing article
    Given the following category exists:
      | name   |
      | Hiking |
    And the following state exists:
      | name       |
      | draft      |
    And the following article exists:
      | title | body | state       | category     |
      | title | body | name: draft | name: Hiking |
    When I go to the home page
    And I follow "Edit"
    And I fill in "Title" with "New Title"
    And I press "Update"
    Then I should be on the article index
    And I should see "New Title"
