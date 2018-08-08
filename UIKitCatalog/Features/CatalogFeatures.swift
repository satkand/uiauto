//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import XCTest

final class CatalogFeatures: XCTestCase {

  private var application: XCUIApplication!

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

      application.swipe(to: index, in: "catalog_table", direction: .up)

      application.tap(element: .init(type: .cell, index: index))

      application.navigateBack()
    }
  }
}
