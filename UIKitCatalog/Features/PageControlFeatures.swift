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
    
    application.expect(element: .init(type: .pageControl, identifier: pageControlIdentifier), to: .haveText("page 3 of 10"))
    
    application.tap(element: .init(type: .pageControl, identifier: pageControlIdentifier), inArea: .left)
    application.expect(element: .init(type: .pageControl, identifier: pageControlIdentifier), to: .haveText("page 2 of 10"))

    application.tap(element: .init(type: .pageControl, identifier: pageControlIdentifier), inArea: .right)
    application.expect(element: .init(type: .pageControl, identifier: pageControlIdentifier), to: .haveText("page 3 of 10"))
  }
  
  func testPageControlSwipes() {
    
    application.expect(element: .init(type: .pageControl, identifier: pageControlIdentifier), to: .haveText("page 3 of 10"))

    application.swipe(element: .init(type: .pageControl, identifier: pageControlIdentifier), direction: .left)
    application.expect(element: .init(type: .pageControl, identifier: pageControlIdentifier), to: .haveText("page 2 of 10"))

    application.swipe(element: .init(type: .pageControl, identifier: pageControlIdentifier), direction: .right)
    application.expect(element: .init(type: .pageControl, identifier: pageControlIdentifier), to: .haveText("page 3 of 10"))
  }
}
