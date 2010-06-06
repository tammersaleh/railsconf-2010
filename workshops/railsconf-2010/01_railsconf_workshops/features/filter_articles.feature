Feature: As a visitor 
         I want to filter the articles by category and state 
         So that I can find the article I want to edit faster

  Scenario: Filter Articles by State
    Given the following articles exist:
      | title              | state           |
      | Draft Article      | name: draft     |
      | Review Article     | name: review    |
      | Published Article  | name: published |
    When I go to the home page
    Then I should see "Draft Article"
    And I should see "Review Article"
    And I should see "Published Article"
    When I select "draft" from "State"
    And I press "Go"
    Then I should see "Draft Article"
    And I should not see "Review Article"
    And I should not see "Published Article"
    When I select "review" from "State"
    And I press "Go"
    Then I should not see "Draft Article"
    And I should see "Review Article"
    And I should not see "Published Article"
    When I select "published" from "State"
    And I press "Go"
    Then I should not see "Draft Article"
    And I should not see "Review Article"
    And I should see "Published Article"

  Scenario: Filter Articles by Category
    Given the following articles exist:
      | title          | category     |
      | Hiking Article | name: Hiking |
      | Skiing Article | name: Skiing |
    When I go to the home page
    Then I should see "Hiking Article"
    And I should see "Skiing Article"
    When I select "Hiking" from "Category"
    And I press "Go"
    Then I should see "Hiking Article"
    And I should not see "Skiing Article"
    When I select "Skiing" from "Category"
    And I press "Go"
    Then I should not see "Hiking Article"
    And I should see "Skiing Article"
