//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import XCTest

final class CatalogFeatures: XCTestCase {

  private var application: XCUIApplication!

  private var table: Element!
  private let tableIdentifier: String = "catalog_table"

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()
    table = Element(type: .table, identifier: tableIdentifier)
  }

  override func tearDown() {
    application = nil
    table = nil
    super.tearDown()
  }

  func testScreenTitle() {
    application.expect(element: .init(type: .navigationBarTitle, identifier: "UIKitCatalog"), to: .exist(true))
  }

  func testScrollingToBottom() {
    application.scroll(element: table, to: .bottom)

    application.expect(element: .init(type: .cell, index: 16), to: .beVisible(true))
  }

  func testScrollingToTop() {
    application.scroll(element: table, to: .bottom)

    application.scroll(element: table, to: .top)

    application.expect(element: .init(type: .cell, index: 0), to: .beVisible(true))
  }

  func testScrollingToCentre() {
    application.scroll(element: table, to: .center)

    application.expect(element: .init(type: .cell, index: 12), to: .beVisible(true))
  }
}
