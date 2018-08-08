//  Copyright © 2018 Apple. All rights reserved.

import XCTest

final class ProgressViewFeatures: XCTestCase {
  
  private var application: XCUIApplication!
  
  override func setUp() {
    super.setUp()
    
    application = XCUIApplication()
    application.launch()
    
    application.tap(.cell, atIndex: 7)
  }
  
  func testProgressViews() {
    
    application.verifyValue(expectedValue: "0%", inElement: .progressView, withIdentifier: "default_progress_view")
    sleep(1)
    application.verifyValue(expectedValue: "10%", inElement: .progressView, withIdentifier: "default_progress_view")
  }
}
