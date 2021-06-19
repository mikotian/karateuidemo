Feature: Karate browser automation

  Background:
    * configure driver = { type: 'chrome' }

  Scenario: Go to react site and check filters.
    Given driver 'https://react-shopping-cart-67954.firebaseapp.com/'
    * waitUntil("document.readyState == 'complete'")
    And match driver.title == 'React Shopping Cart'
    And match text('.products-found') contains '16'
    * screenshot()
    Then click('input[value=XS]')
    * waitUntil("document.readyState == 'complete'")
    * delay(1000)
    And match text('.products-found') contains '1'
    * screenshot()

  Scenario: Go to react site and check complex filtering.
    Given driver 'https://react-shopping-cart-67954.firebaseapp.com/'
    * waitUntil("document.readyState == 'complete'")
    And match driver.title == 'React Shopping Cart'
    And match text('.products-found') contains '16'
    * screenshot()
    Then click('input[value=XS]')
    * waitUntil("document.readyState == 'complete'")
    * delay(1000)
    And match text('.products-found') contains '1'
    * screenshot()
    Then click('input[value=S]')
    * delay(1000)
    And match text('.products-found') contains '2'
    * screenshot()


