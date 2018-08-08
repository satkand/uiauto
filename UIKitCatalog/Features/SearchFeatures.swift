//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import XCTest

final class SearchFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()

    application.tap(element: .init(type: .cell, index: 8))
  }

  func testDefaultSearchBar() {
    application.tap(element: .init(type: .cell, index: 0))

    application.search(text: "Hello World", inSearchBar: "search_search_bar_default_search_bar")
    application.tap(element: .init(type: .button, identifier: "Scope Two"))
    application.clearText(inSearchBar: "search_search_bar_default_search_bar")
  }

  func testSearchController() {
    application.tap(element: .init(type: .cell, index: 2))

    application.search(text: "Hello World", inSearchBar: "search_search_controller_search_bar")
    application.clearText(inSearchBar: "search_search_controller_search_bar")
    application.tap(element: .init(type: .button, identifier: "Cancel"))
  }
}
