//  Copyright © 2018 Outware Mobile. All rights reserved.

import Foundation

public struct Element {

  public let type: Robocop.ElementType

  public let identifier: String?

  public let index: Int?

  public init(type: Robocop.ElementType, identifier: String? = nil, index: Int? = nil) {
    self.type = type
    self.identifier = identifier
    self.index = index
  }
}
