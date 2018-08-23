//  Copyright © 2018 Outware Mobile. All rights reserved.

/// This struct contains the required details in order to perform a `XCUIElementQuery`
///
/// It is strongly recommended to use a unique identifier per screen elements
/// as relying solely on the index or the element type will create flaky tests.
public class Element {
  /// The type of the element
  let type: Robocop.ElementType

  /// The identifier of the element
  let identifier: String?

  /// The index of the element
  /// (note: this might not be the programmed index as UI tests will return a list containing all matching elements)
  let index: Int?

  public init(type: ElementType, identifier: String?, index: Int?) {
    self.type = type
    self.identifier = identifier
    self.index = index
  }

  public convenience init(type: Robocop.ElementType) {
    self.init(type: type, identifier: nil, index: nil)
  }

  public convenience init(type: Robocop.ElementType, identifier: String) {
    self.init(type: type, identifier: identifier, index: nil)
  }

  public convenience init(type: Robocop.ElementType, index: Int) {
    self.init(type: type, identifier: nil, index: index)
  }
}
