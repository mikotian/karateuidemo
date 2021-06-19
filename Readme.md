
~~~
root
├── pom.xml     -- Maven Dependency File             
├── Readme.md
├── src
│   └── test
│       └── java
│           ├── examples
│           │   ├── ExamplesTest.java             -- Runner Class
│           │   ├── ui
│           │   │   ├── reactTests.feature        -- UI Test Feature
│           │   │   └── youtube.feature           -- UI Test Feature
│           │   └── users
│           │       ├── users.feature             -- API Test Feature
│           │       └── UsersRunner.java          -- API Test Feature
│           ├── karate-config.js                  -- Karate Configuration File
│           └── logback-test.xml                  -- logger configuration
└── target                                        -- This is where reports will be generated
    └── karate.log

~~~

## Setup your machine

Install JDK : 

The project has the Java version as 1.8 but it can be built using version 11 as well

    JDK 1.8 :

    https://www.oracle.com/java/technologies/javase/javase-jdk8-downloads.html

    JDK Version 11 :
    
    https://www.oracle.com/java/technologies/javase-jdk11-downloads.html

Install Maven :

    https://maven.apache.org/download.cgi
---
### Quick Setup

* Clone this repo

* Navigate to the root folder

* Open a command prompt/terminal and paste this command

~~~
mvn test
~~~

This will run your tests and produce reports in the target directory

---

## IDE Setup(Eclipse/Intellij/VSCode)

Open the main folder and the IDE should ask you if you want to setup the project as a maven project. Say yes.

Another way is to import the pom.xml as a maven project.


## Adding tests

Create new feature file (or edit the one provided)

~~~
Feature: Karate browser automation

  Background:
    * configure driver = { type: 'chrome' }

  Scenario: Go to react site and check filters.
    # URL of test site
    Given driver 'https://react-shopping-cart-67954.firebaseapp.com/'
    # wait for site to complete loading
    * waitUntil("document.readyState == 'complete'")
    # verification
    And match driver.title == 'React Shopping Cart'
    And match text('.products-found') contains '16'
    * screenshot()
    Then click('input[value=XS]')
    * waitUntil("document.readyState == 'complete'")
    * delay(1000)
    And match text('.products-found') contains '1'
    * screenshot()
~~~

The code above is self-contained and if you add a feature file with the above content in the "features" directory then
the new tests will be added to the tests executed when the following command is executed:

~~~
mvn test
~~~

For more details on the Karate UI DSL and other samples visit: [Karate Docs](https://intuit.github.io/karate/karate-core/)

## Viewing Tests Results

#### Karate Reports:
Navigate to ./target/karate-reports/karate-summary.html

## Using an archetype to generate this sort of project

Archetype is a Maven project templating toolkit. This project was generated using a karate archetype.
The command to generate it is as follows:

~~~
mvn archetype:generate \
-DarchetypeGroupId=com.intuit.karate \
-DarchetypeArtifactId=karate-archetype \
-DarchetypeVersion=1.0.1 \
-DgroupId=com.cw \
-DartifactId=karateuiproj
~~~

