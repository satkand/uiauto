//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import XCTest

final class UninstallApplicationFeatures: Feature {

  func testUninstallingTheApplication() {
    uninstallApplication(named: "UIKitCatalog")

    // Ensure that application is deleted
    XCTAssertFalse(XCUIApplication(bundleIdentifier: "com.apple.springboard").icons["UIKitCatalog"].firstMatch.exists)
  }
}
