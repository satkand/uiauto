//  Copyright © 2018 Apple. All rights reserved.

import Robocop

final class SearchFeatures: Feature {
  override func afterLaunch() {
    app.tap(element: Cell(index: 8))
  }

  func testDefaultSearchBar() {
    app.tap(element: Cell(index: 0))

    app.search(text: "Hello World", inSearchBar: "search_search_bar_default_search_bar")
    app.tap(element: Button(identifier: "Scope Two"))
    app.clearText(inSearchBar: "search_search_bar_default_search_bar")
  }

  func testSearchController() {
    app.tap(element: Cell(index: 2))

    app.search(text: "Hello World", inSearchBar: "search_search_controller_search_bar")
    app.clearText(inSearchBar: "search_search_controller_search_bar")
    app.tap(element: Button(identifier: "Cancel"))
  }
}
