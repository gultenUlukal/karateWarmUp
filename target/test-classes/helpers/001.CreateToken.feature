Feature: Create Token 

Scenario: Create Token
 Given url 'https://conduit-api.bondaracademy.com/api'
 Given path 'users/login'
 And request {"user":{"email":"gulten.ulukal@mail.com","password":"gulten"}}
 When method Post
 Then status 200
 * def authToken = response.user.token
