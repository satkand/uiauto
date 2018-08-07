//  Copyright © 2018 Apple. All rights reserved.

import XCTest

final class PageControlFeatures: XCTestCase {
  
  private var application: XCUIApplication!
  private let pageControlIdentifier: String = "page_control"
  
  override func setUp() {
    super.setUp()
    
    application = XCUIApplication()
    application.launch()
    
    application.tap(.cell, atIndex: 5)
  }
  
  func testPageControlTaps() {
    
    application.verifyValue(expectedValue: "page 3 of 10", inElement: .pageControl, withIdentifier: pageControlIdentifier)
    
    application.tap(.pageControl, withIdentifier: pageControlIdentifier, withLocationArea: .left)
    application.verifyValue(expectedValue: "page 2 of 10", inElement: .pageControl, withIdentifier: pageControlIdentifier)
    
    application.tap(.pageControl, withIdentifier: pageControlIdentifier, withLocationArea: .right)
    application.verifyValue(expectedValue: "page 3 of 10", inElement: .pageControl, withIdentifier: pageControlIdentifier)
  }
  
  func testPageControlSwipes() {
    
    application.verifyValue(expectedValue: "page 3 of 10", inElement: .pageControl, withIdentifier: pageControlIdentifier)
    
    application.swipe(.pageControl, withIdentifier: pageControlIdentifier, direction: .left)
    application.verifyValue(expectedValue: "page 2 of 10", inElement: .pageControl, withIdentifier: pageControlIdentifier)
    
    application.swipe(.pageControl, withIdentifier: pageControlIdentifier, direction: .right)
    application.verifyValue(expectedValue: "page 3 of 10", inElement: .pageControl, withIdentifier: pageControlIdentifier)
  }
}
