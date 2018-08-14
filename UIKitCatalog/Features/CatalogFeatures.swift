//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import XCTest

final class CatalogFeatures: XCTestCase {

  private var application: XCUIApplication!

  private lazy var tableElement: Element = .init(type: .table, identifier: tableIdentifier)
  private let tableIdentifier: String = "catalog_table"

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()
  }

  func testScreenTitle() {
    application.expect(element: .init(type: .navigationBarTitle, identifier: "UIKitCatalog"), to: .exist(true))
  }

  func testTappingEachCells() {

    (0 ..< 18).forEach { index in

      application.swipe(to: index, in: tableIdentifier, direction: .up)

      application.tap(element: .init(type: .cell, index: index))

      application.navigateBack()
    }
  }

  func testScrollingToBottom() {
    application.scroll(element: tableElement, to: .bottom)

    application.expect(element: .init(type: .cell, index: 16), to: .beVisible(true))
  }

  func testScrollingToTop() {
    application.scroll(element: tableElement, to: .bottom)

    application.scroll(element: tableElement, to: .top)

    application.expect(element: .init(type: .cell, index: 0), to: .beVisible(true))
  }

  func testScrollingToCentre() {
    application.scroll(element: tableElement, to: .center)

    application.expect(element: .init(type: .cell, index: 12), to: .beVisible(true))
  }
}
