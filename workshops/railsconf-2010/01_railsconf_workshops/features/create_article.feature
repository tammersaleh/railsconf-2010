Feature: As a visitor I want to create an article so that I can publish things

  Scenario: Visitor creates new article
    Given the following category exists:
      | name   |
      | Hiking |
    And the following state exists:
      | name       |
      | draft      |
    When I go to the home page
    And I follow "New article"
    And I select "Hiking" from "Category"
    And I select "draft" from "State"
    And I press "Create"
    Then I should be on the article index
    And I should see "Article was successfully created"
