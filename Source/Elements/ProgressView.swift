//  Copyright © 2018 Outware Mobile. All rights reserved.

public class ProgressView: Element {
  public init(identifier: String?, index: Int?) {
    super.init(type: .progressView, identifier: identifier, index: index)
  }

  public convenience init(identifier: String) {
    self.init(identifier: identifier, index: nil)
  }

  public convenience init(index: Int) {
    self.init(identifier: nil, index: index)
  }
}
