//  Copyright © 2018 Apple. All rights reserved.

import Robocop

final class SwitchFeatures: Feature {
  override func afterLaunch() {
    let cell = Cell(index: 13)
    let table = Table(identifier: "catalog_table")

    app.swipe(to: cell, in: table, direction: .up)
    app.tap(element: cell)
  }

  func testSwitches() {
    let defaultSwitch = Switch(identifier: "default_switch")
    let customSwitch = Switch(index: 1)

    app.expect(element: defaultSwitch, to: .haveBool(true))
    app.expect(element: customSwitch, to: .haveBool(true))

    app.tap(element: defaultSwitch)
    app.tap(element: customSwitch)

    app.expect(element: defaultSwitch, to: .haveBool(false))
    app.expect(element: customSwitch, to: .haveBool(false))

    app.tap(element: customSwitch)

    app.expect(element: customSwitch, to: .haveBool(true))
  }
}
