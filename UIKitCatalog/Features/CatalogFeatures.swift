//  Copyright © 2018 Apple. All rights reserved.

import XCTest
import Robocop

final class CatalogFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()
  }

  func testScreenTitle() {
    application.verifyExistence(ofElement: .navigationBarTitle, withIdentifier: "UIKitCatalog")
  }

  func testTappingEachCells() {

    (0 ..< 18).forEach { index in

      application.swipe(to: index, in: "catalog_table", direction: .up)

      application.tap(.cell, atIndex: index)

      application.navigateBack()
    }
  }
}
