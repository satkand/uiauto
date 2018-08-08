//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import XCTest

final class AlertControllerFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()

    application.tap(element: .init(type: .cell, index: 1))
  }

  // MARK: Alert Styles

  func testAlertSimpleStyle() {
    application.tap(element: .init(type: .cell, index: 0))
    application.tap(element: .init(type: .alertButton, index: 0))
  }

  func testOKCancelStyle() {
    application.tap(element: .init(type: .cell, index: 1))
    application.tap(element: .init(type: .alertButton, index: 0))

    application.tap(element: .init(type: .cell, index: 1))
    application.tap(element: .init(type: .alertButton, index: 1))
  }

  func testThreeButtonsStyle() {
    application.tap(element: .init(type: .cell, index: 2))
    application.tap(element: .init(type: .alertButton, index: 0))

    application.tap(element: .init(type: .cell, index: 2))
    application.tap(element: .init(type: .alertButton, identifier: "Choice Two"))

    application.tap(element: .init(type: .cell, index: 2))
    application.tap(element: .init(type: .alertButton, identifier: "Cancel"))
  }

  func testTextEntryStyle() {
    application.tap(element: .init(type: .cell, index: 3))
    application.type(text: "Hello World", intoElement: "alert_text_field")
    application.tap(element: .init(type: .alertButton, identifier: "OK"))
  }

  func testSecureTextEntryStyle() {
    application.tap(element: .init(type: .cell, index: 4))
    application.type(text: "Hello World", intoElement: "alert_secure_text_field", ofType: .secureTextField)
    application.tap(element: .init(type: .alertButton, identifier: "OK"))
  }

  // MARK: Action Sheet Styles

  func testActionSheetComfirmCancelStyle() {
    application.tap(element: .init(type: .cell, index: 5))
    application.tap(element: .init(type: .actionSheetButton, index: 0))

    application.tap(element: .init(type: .cell, index: 5))
    application.tap(element: .init(type: .actionSheetButton, identifier: "Cancel"))
  }

  func testActionSheetDestructiveStyle() {
    application.tap(element: .init(type: .cell, index: 6))
    application.tap(element: .init(type: .actionSheetButton, index: 0))

    application.tap(element: .init(type: .cell, index: 6))
    application.tap(element: .init(type: .actionSheetButton, index: 1))
  }
}
