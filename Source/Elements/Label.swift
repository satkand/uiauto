//  Copyright © 2018 Outware Mobile. All rights reserved.

public class Label: Element {
  public init(identifier: String?, index: Int?) {
    super.init(type: .label, identifier: identifier, index: index)
  }

  public convenience init(identifier: String) {
    self.init(identifier: identifier, index: nil)
  }

  public convenience init(index: Int) {
    self.init(identifier: nil, index: index)
  }
}
