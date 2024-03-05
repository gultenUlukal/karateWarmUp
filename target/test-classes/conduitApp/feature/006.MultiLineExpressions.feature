Feature: Sign up new user

Background: Preconditions
    Given url apiUrl

@ignore
Scenario: New User Sign Up

    Given def userData = {{"email":"gulten.yonk1@mail.com","username":"gultedfdsfn1"}}
    Given path 'users'
    And request {"user":{"email":#(userData.email),"password":"gulten","username":#(userData.username)}}
    When method Post
    Then status 201

@ignore
Scenario: New User Sign Up Embeded Expressions

    Given def userData = {"email":"gulten.yonkuc1@mail.com","username":"gultenUlukal1"}
    Given path 'users'
    And request {"user":{"email":#('Test' + userData.email),"password":"gulten","username":#('Test' + userData.username)}}
    When method Post
    Then status 201

@ignore
Scenario: New User Sign Up Multiline Expressions

    Given def userData = {"email":"gulten.yonku23@mail.com","username":"gultenUluka23"}
    Given path 'users'
    And request 
    """
        { 
            "user":{
                "email": "gulten@mail.com",
                "password":"gulten",
                "username":"gulukal"
                
            }
        }
    """
    When method Post
    Then status 201

@debug
Scenario: New User Sign Up Multiline Expressions

    Given def userData = {"email":"gulten.yonku23@mail.com","username":"gultenUluka23"}
    Given path 'users'
    And request 
    """
        { 
            "user":{
                "email": #(userData.email),
                "password":"gulten",
                "username":#(userData.username):
                
            }
        }
    """
    When method Post
    Then status 201