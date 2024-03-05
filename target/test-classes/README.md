# Using tags

### to run sapare test cases @giveAnUniqName

```
@giveAnUniqName
mvn test -Dkarate.options="--tags @giveAnUniqName"
mvn test -Dkarate.options="--tags @debug"
```

```
mvn test -Dkarate.options="--tags @debug" -Dkarate.env="dev"
```

### use it to dont run the scenario
```
@ignore 
mvn install
``` 

### to execute each test instead of @skipme one
```
@skipme
use it to dont run the scenario
mvn test -Dkarate.options="--tags ~@skipme"
``` 

### execute only one test by given file informations and row
```
mvn test -Dkarate.options="classpath:conduitApp/users/001.feature:8"
```