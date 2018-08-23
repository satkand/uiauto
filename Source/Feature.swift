//  Copyright © 2018 Apple. All rights reserved.

import XCTest

open class Feature: XCTestCase {
  public private(set) var app: XCUIApplication!
  public private(set) var settingsApp: XCUIApplication!

  open override func setUp() {
    super.setUp()

    app = XCUIApplication()
    settingsApp = XCUIApplication(bundleIdentifier: "com.apple.Preferences")

    beforeLaunch()

    app.launch()

    afterLaunch()
  }

  open override func tearDown() {
    app.terminate()
    app = nil

    super.tearDown()
  }

  open func beforeLaunch() {}
  open func afterLaunch() {}
}
