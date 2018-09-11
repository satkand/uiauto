//  Copyright © 2018 Apple. All rights reserved.

import Robocop
import Swifter
import XCTest

@testable import UIKitCatalog

final class LoadRequestFeatures: Feature {
  private var server: HttpServer!

  override func beforeLaunch() {
    app.launchArguments = ["UITesting"]

    let response: String = """
    {
      "name": "Foo-Bar"
    }
    """

    let json = try! JSONSerialization.jsonObject(with: response.data(using: .utf8)!, options: [])

    server = HttpServer()
    server.GET["/stub/projecthub/projects/1"] = { _ in HttpResponse.ok(.json(json as AnyObject)) }

    try! server.start()
  }

  override func tearDown() {
    server.stop()
    super.tearDown()
  }

  func testLoadingAnImage() {
    app.swipe(to: Cell(index: 26), in: Table(identifier: "catalog_table"), direction: .up)
    app.tap(element: Cell(index: 26))

    app.expect(element: Label(identifier: "Foo-Bar"), to: .exist(true))
  }
}
