
Feature: Tests for the home page

  Background: Define URL
    Given url apiUrl

  Scenario: Get all tags
    Given path 'tags'
    When method Get
    Then status 200
    And match response.tags contains 'Test'
    And match response.tags !contains 'animal'
    And match response.tags contains any ['Test', 'animal'] 
    And match response.tags == "#array"
    And match each response.tags == "#string"


  @ignore
  Scenario: Get 10 articles from the page
    Given params {limit: 10 ,offset: 0}
    Given path 'articles'
    When method Get
    Then status 200


  Scenario: Get 10 articles from the page other
    Given params {limit: 10 ,offset: 0}
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articles == "#[10]"
    And match response.articlesCount == 10
    And match response.articlesCount != 100
    And match response == {"articles": "#array", "articlesCount": 10}
    And match response.articles[0].createdAt contains '2024'
    # at least 1 favoritesCount should be 1 for all articles response
    And match response.articles[*].favoritesCount contains 1
    And match response.articles[*].author.bio contains null
    # the same with below one ".."
    And match response..bio contains null
    # And match each response..following == true   --> 
    # $ | match each failed at index 0 (LIST:BOOLEAN)
    # [false,false,false,false,false,false,false,false,false,false]
    # true
    # if it fall in first place the test is not pass with .. way 
    And match each response..following == false