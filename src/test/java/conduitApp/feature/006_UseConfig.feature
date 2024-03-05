Feature: Tests for the home page

#  kind of before each 

Background: Define URL
  Given url apiUrl


 Scenario: Create and delete the article
 
  Given path 'articles'
  And request {"article":{"title":"title","description":"description","body":"body","tagList":["tagList1","tagList2","dfstagList3"]}}
  When method Post
  Then status 201
  * def articleId = response.article.slug

  Given params { limit: 10 , offset: 0}
  Given path 'articles'
  When method Get
  Then status 200

  Given path 'articles', articleId
  When method Delete
  Then status 204

  Given params { limit: 10 , offset: 0}
  Given path 'articles'
  When method Get
  Then status 200
  And match response.articles[0].title != 'title'