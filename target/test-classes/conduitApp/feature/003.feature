Feature: Tests for the home page

Background: Define URL
  Given url 'https://conduit-api.bondaracademy.com/api'
  Given path 'users/login'
  And request {"user":{"email":"gulten.ulukal@mail.com","password":"gulten"}}
  When method Post
  Then status 200
  * def token = response.user.token


@ignore
Scenario: Create a new article
  Given header Authorization = 'Token ' + token
  Given path 'articles'
  And request {"article":{"title":"Title","description":"rsdfsdf","body":"tsdfsdf","tagList":["y","dfsdf","dfsd"]}}
  When method Post
  Then status 201
  And match response.article.title == 'Title'
 