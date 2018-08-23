//  Copyright © 2018 Apple. All rights reserved.

import Robocop

final class ToolbarsFeatures: Feature {
  override func afterLaunch() {
    let cell = Cell(index: 16)
    let table = Table(identifier: "catalog_table")

    app.swipe(to: cell, in: table, direction: .up)
    app.tap(element: cell)
  }

  func testToolbar() {
    app.tap(element: Cell(index: 0))
    app.tap(element: Button(identifier: "Action"))
  }
}
