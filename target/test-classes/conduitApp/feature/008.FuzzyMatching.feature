@gulukal
Feature: Tests for the home page

  Background: Define URL
    Given url apiUrl

  Scenario: Get all tags
    Given path 'tags'
    When method Get
    Then status 200
    And match response.tags == "#array"
    And match each response.tags == "#string"

  Scenario: Get 10 articles from the page other
    Given params {limit: 10 ,offset: 0}
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articles == "#[10]"
    And match response.articlesCount == 11
    And match response.articlesCount != 100
    And match response == {"articles": "#array", "articlesCount": 11}
    # double hash means string or null 
    And match each response..bio == '##string'
    # all values are boolean
    And match each response..following == '#boolean'
    # all values are number
    And match each response..favoritesCount == '#number'