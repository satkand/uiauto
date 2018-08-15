//  Copyright © 2018 Apple. All rights reserved.

import XCTest

final class UninstallApplicationFeatures: XCTestCase {

  func testUninstallingTheApplication() {
    // Launch application to install it
    XCUIApplication().launch()

    // Uninstall the application
    uninstallApplication(named: "UIKitCatalog")

    // Ensure that application is deleted
    XCTAssertFalse(XCUIApplication(bundleIdentifier: "com.apple.springboard").icons["UIKitCatalog"].firstMatch.exists)
  }
}
