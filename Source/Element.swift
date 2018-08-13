//  Copyright © 2018 Outware Mobile. All rights reserved.

import Foundation

/// This struct contains the required details in order to perform a `XCUIElementQuery`
///
/// It is strongly recommended to use a unique identifier per screen elements
/// as relying solely on the index or the element type will create flaky tests.
public struct Element {

  /// The type of the element
  public let type: Robocop.ElementType

  /// The identifier of the element
  public let identifier: String?

  /// The index of the element
  /// (note: this might not be the programmed index as UI tests will return a list containing all matching elements)
  public let index: Int?

  /// Initialises an `Element` with no identifier or index
  public init(type: Robocop.ElementType) {
    self.type = type
    self.identifier = nil
    self.index = nil
  }

  /// Initialises an `Element` with an identifier
  public init(type: Robocop.ElementType, identifier: String) {
    self.type = type
    self.identifier = identifier
    self.index = nil
  }

  /// Initialises an `Element` with an index
  public init(type: Robocop.ElementType, index: Int) {
    self.type = type
    self.identifier = nil
    self.index = index
  }
}
