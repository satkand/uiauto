//  Copyright © 2018 Apple. All rights reserved.

import XCTest
import Robocop

final class AlertControllerFeatures: XCTestCase {

  private var application: XCUIApplication!

  override func setUp() {
    super.setUp()

    application = XCUIApplication()
    application.launch()

    application.tap(.cell, atIndex: 1)
  }

  // MARK: Alert Styles

  func testAlertSimpleStyle() {
    application.tap(.cell, atIndex: 0)
    application.tap(.alertButton, atIndex: 0)
  }

  func testOKCancelStyle() {
    application.tap(.cell, atIndex: 1)
    application.tap(.alertButton, atIndex: 0)

    application.tap(.cell, atIndex: 1)
    application.tap(.alertButton, atIndex: 1)
  }

  func testThreeButtonsStyle() {
    application.tap(.cell, atIndex: 2)
    application.tap(.alertButton, atIndex: 0)

    application.tap(.cell, atIndex: 2)
    application.tap(.alertButton, withIdentifier: "Choice Two")

    application.tap(.cell, atIndex: 2)
    application.tap(.alertButton, withIdentifier: "Cancel")
  }

  func testTextEntryStyle() {
    application.tap(.cell, atIndex: 3)
    application.type(text: "Hello World", intoElement: "alert_text_field")
    application.tap(.alertButton, withIdentifier: "OK")
  }

  func testSecureTextEntryStyle() {
    application.tap(.cell, atIndex: 4)
    application.type(text: "Hello World", intoElement: "alert_secure_text_field", ofType: .secureTextField)
    application.tap(.alertButton, withIdentifier: "OK")
  }


  // MARK: Action Sheet Styles

  func testActionSheetComfirmCancelStyle() {
    application.tap(.cell, atIndex: 5)
    application.tap(.actionSheetButton, atIndex: 0)

    application.tap(.cell, atIndex: 5)
    application.tap(.actionSheetButton, withIdentifier: "Cancel")
  }

  func testActionSheetDestructiveStyle() {
    application.tap(.cell, atIndex: 6)
    application.tap(.actionSheetButton, atIndex: 0)

    application.tap(.cell, atIndex: 6)
    application.tap(.actionSheetButton, atIndex: 1)
  }
}
