Feature: Tests for the home page

#  kind of before each 

Background: Define URL
  Given url 'https://conduit-api.bondaracademy.com/api'
  # Given path 'users/login'
  # And request {"user":{"email":"gulten.ulukal@mail.com","password":"gulten"}}
  # When method Post
  # Then status 200
  # * def token = response.user.token

  # use helpers to get token
  # if you use call it will call each time 
  # if callone just ones it calls
  * def tokenResponse = callonce read('classpath:helpers/CreateToken.feature')
  * def token = tokenResponse.authToken


Scenario: Create and delete the article
  Given header Authorization = 'Token ' + token
  Given path 'articles'
  And request {"article":{"title":"title","description":"description","body":"body","tagList":["tagList1","tagList2","dfstagList3"]}}
  When method Post
  Then status 201
  * def articleId = response.article.slug

  Given params { limit: 10 , offset: 0}
  Given path 'articles'
  When method Get
  Then status 200

  Given header Authorization =  'Token ' + token
  Given path 'articles', articleId
  When method Delete
  Then status 204

  Given params { limit: 10 , offset: 0}
  Given path 'articles'
  When method Get
  Then status 200
  And match response.articles[0].title != 'title'