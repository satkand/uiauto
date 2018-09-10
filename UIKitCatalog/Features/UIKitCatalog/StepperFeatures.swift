//  Copyright © 2018 Apple. All rights reserved.

import Robocop

final class StepperFeatures: Feature {
  override func afterLaunch() {
    let cell = Cell(identifier: "cell_steppers")
    let table = Table(identifier: "catalog_table")

    app.swipe(to: cell, in: table, direction: .up)
    app.tap(element: cell)
  }

  func testSteppers() {
    app.expect(stepButton: .up, atIndex: 0, toExists: true)
    app.expect(stepButton: .down, atIndex: 0, toExists: true)

    let label = Label(index: 0)
    app.expect(element: label, to: .haveText("0"))

    app.step(.up, index: 0)

    app.expect(element: label, to: .haveText("1"))

    // We cannot go below 0 even if we click the decremenent button multiple times
    app.step(.down, index: 0)
    app.step(.down, index: 0)

    app.expect(element: label, to: .haveText("0"))
  }
}
