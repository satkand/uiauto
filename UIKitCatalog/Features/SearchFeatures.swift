//  Copyright © 2018 Apple. All rights reserved.

import XCTest
import Robocop

final class SearchFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()

    application.tap(.cell, atIndex: 8)
  }

  func testDefaultSearchBar() {
    application.tap(.cell, atIndex: 0)

    application.search(text: "Hello World", inSearchBar: "search_search_bar_default_search_bar")
    application.tap(.button, withIdentifier: "Scope Two")
    application.clearText(inSearchBar: "search_search_bar_default_search_bar")
  }

  func testSearchController() {
    application.tap(.cell, atIndex: 2)

    application.search(text: "Hello World", inSearchBar: "search_search_controller_search_bar")
    application.clearText(inSearchBar: "search_search_controller_search_bar")
    application.tap(.button, withIdentifier: "Cancel")
  }
}
