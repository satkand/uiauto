//  Copyright © 2018 Apple. All rights reserved.

import Robocop

final class CatalogFeatures: Feature {
  private var table: Element!

  override func afterLaunch() {
    table = Table(identifier: "catalog_table")
  }

  func testScreenTitle() {
    let navigationBarTitle = NavigationBarTitle(identifier: "UIKitCatalog")
    app.expect(element: navigationBarTitle, to: .exist(true))
  }

  func testScrollingToBottom() {
    app.scroll(element: table, to: .bottom)

    let cell = Cell(index: 16)
    app.expect(element: cell, to: .beVisible(true))
  }

  func testScrollingToTop() {
    app.scroll(element: table, to: .bottom)

    app.scroll(element: table, to: .top)

    let cell = Cell(index: 0)
    app.expect(element: cell, to: .beVisible(true))
  }

  func testScrollingToCentre() {
    app.scroll(element: table, to: .center)

    let cell = Cell(index: 12)
    app.expect(element: cell, to: .beVisible(true))
  }
}
