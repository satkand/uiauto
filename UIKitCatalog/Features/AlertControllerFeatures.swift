//  Copyright © 2018 Apple. All rights reserved.

import Robocop

final class AlertControllerFeatures: Feature {
  override func afterLaunch() {
    let alertControllersCell = Cell(index: 1)
    app.tap(element: alertControllersCell)
  }

  // MARK: Alert Styles

  func testAlertSimpleStyle() {
    let simpleAlertCell = Cell(index: 0)

    app.tap(element: simpleAlertCell)

    let okayButton = AlertButton(index: 0)
    app.tap(element: okayButton)
  }

  func testOKCancelStyle() {
    let cell = Cell(index: 1)

    app.tap(element: cell)

    let cancelButton = AlertButton(index: 0)
    app.tap(element: cancelButton)

    app.tap(element: cell)

    let okayButton = AlertButton(index: 1)
    app.tap(element: okayButton)
  }

  func testThreeButtonsStyle() {
    let cell = Cell(index: 2)

    app.tap(element: cell)
    let choice1Button: AlertButton = AlertButton(index: 0)
    app.tap(element: choice1Button)

    app.tap(element: cell)
    let choice2Button: AlertButton = AlertButton(identifier: "Choice Two")
    app.tap(element: choice2Button)

    app.tap(element: cell)
    let cancelButton: AlertButton = AlertButton(identifier: "Cancel")
    app.tap(element: cancelButton)
  }

  func testTextEntryStyle() {
    let cell = Cell(index: 3)
    app.tap(element: cell)

    let textField = TextField(identifier: "alert_text_field")
    app.type(text: "Hello World", into: textField)

    let okayButton: AlertButton = AlertButton(identifier: "OK")
    app.tap(element: okayButton)
  }

  func testSecureTextEntryStyle() {
    let cell = Cell(index: 4)

    app.tap(element: cell)
    let textField = SecureTextField(identifier: "alert_secure_text_field")
    app.type(text: "Hello World", into: textField)

    let okayButton = AlertButton(identifier: "OK")
    app.tap(element: okayButton)
  }

  // MARK: Action Sheet Styles

  func testActionSheetComfirmCancelStyle() {
    let cell: Cell = Cell(index: 5)

    app.tap(element: cell)
    let confirmButton = ActionSheetButton(index: 0)
    app.tap(element: confirmButton)

    app.tap(element: cell)
    let cancelButton = ActionSheetButton(identifier: "Cancel")
    app.tap(element: cancelButton)
  }

  func testActionSheetDestructiveStyle() {
    let cell: Cell = Cell(index: 6)

    app.tap(element: cell)
    let descructiveChoice = ActionSheetButton(index: 0)
    app.tap(element: descructiveChoice)

    app.tap(element: cell)
    let safeChoice = ActionSheetButton(index: 1)
    app.tap(element: safeChoice)
  }
}
