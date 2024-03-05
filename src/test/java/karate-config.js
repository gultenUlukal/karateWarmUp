function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }

  var config = {
    apiUrl: "https://conduit-api.bondaracademy.com/api"
  }

  if (env == 'dev') {
  config.userEmail = "gulten.ulukal@mail.com"
  config.userPassword = "gulten"
  } 

  if (env == 'qa') {
    config.userEmail = "qa@mail.com"
    config.userPassword = "qa"
  }

  var accessToken = karate.callSingle('classpath:helpers/003.CreateTokenUseConfig.feature',config).authToken
  karate.configure('headers',{Authorization: "Token " + accessToken})
  
  return config;
}