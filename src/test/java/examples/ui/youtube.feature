Feature: Karate browser automation

  Background:
    * configure driver = { type: 'chrome' }

  Scenario: google search, land on the YouTube, and search for connectwise.

    Given driver 'https://google.com'
    And input('input[name=q]', 'Youtube')
    And click('input[name=btnK]')
    When click("h3[class='LC20lb DKV0Md']")
    Then waitForUrl('https://www.youtube.com/')
    And click('input[id=search]')
    And input('input[id=search]', 'connectwise')
    And click('button[id=search-icon-legacy]')
    * waitUntil("document.readyState == 'complete'")
    And match driver.url == 'https://www.youtube.com/results?search_query=connectwise'