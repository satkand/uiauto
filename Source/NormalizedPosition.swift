//  Copyright © 2018 Outware Mobile. All rights reserved.

/// Represents a relative position in the containing plane. If we consider a frame, (x: 0.0, y: 0.0) would represent the
/// top-left point while (x: 1.0, y: 1.0) the bottom-right point.
public struct NormalizedPosition {
  let x: CGFloat
  let y: CGFloat

  /// Initialises a normalized position with the given x and y values. Crashes if given values that are not between
  /// 0.0 and 1.0.
  ///
  /// - Parameters:
  ///   - x: the value representing the horizontal position.
  ///   - y: the value representing the vertical position.
  public init(x: CGFloat, y: CGFloat) {
    guard x >= 0 && x <= 1 else {
      fatalError("Invalid horizontal position: Normalized values should be between 0.0 and 1.0.")
    }

    guard y >= 0 && y <= 1 else {
      fatalError("Invalid vertical position: Normalized values should be between 0.0 and 1.0.")
    }

    self.x = x
    self.y = y
  }
}

extension NormalizedPosition {

  static var center: NormalizedPosition {
    return NormalizedPosition(x: 0.5, y: 0.5)
  }

  var vector: CGVector {
    return CGVector(dx: x, dy: y)
  }

  var inverted: NormalizedPosition {
    return NormalizedPosition(x: 1 - x, y: 1 - y)
  }

  func offsetting(by vector: CGVector) -> NormalizedPosition {
    return NormalizedPosition(x: x + vector.dx, y: y + vector.dy)
  }
}
