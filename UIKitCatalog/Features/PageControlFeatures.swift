//  Copyright © 2018 Apple. All rights reserved.

import XCTest

final class PageControlFeatures: XCTestCase {
  
  private var application: XCUIApplication!
  private let pageControlIdentifier: String = "page_control"
  
  override func setUp() {
    super.setUp()
    
    application = XCUIApplication()
    application.launch()
    
    application.tap(element: .init(type: .cell, index: 5))
  }
  
  func testPageControlTaps() {
    
    application.verifyText("page 3 of 10", inElement: .init(type: .pageControl, identifier: pageControlIdentifier))
    
    application.tap(element: .init(type: .pageControl, identifier: pageControlIdentifier), inArea: .left)
    application.verifyText("page 2 of 10", inElement: .init(type: .pageControl, identifier: pageControlIdentifier))
    
    application.tap(element: .init(type: .pageControl, identifier: pageControlIdentifier), inArea: .right)
    application.verifyText("page 3 of 10", inElement: .init(type: .pageControl, identifier: pageControlIdentifier))
  }
  
  func testPageControlSwipes() {
    
    application.verifyText("page 3 of 10", inElement: .init(type: .pageControl, identifier: pageControlIdentifier))

    application.swipe(element: .init(type: .pageControl, identifier: pageControlIdentifier), direction: .left)
    application.verifyText("page 2 of 10", inElement: .init(type: .pageControl, identifier: pageControlIdentifier))
    
    application.swipe(element: .init(type: .pageControl, identifier: pageControlIdentifier), direction: .right)
    application.verifyText("page 3 of 10", inElement: .init(type: .pageControl, identifier: pageControlIdentifier))
  }
}
