//  Copyright © 2018 Apple. All rights reserved.

import XCTest

final class UninstallApplicationFeatures: XCTestCase {

  func testUninstallingTheApplication() {
    uninstallApplication(named: "UIKitCatalog")
  }
}
