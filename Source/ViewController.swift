//  Copyright © 2017 Outware Mobile. All rights reserved.

import UIKit

final class ViewController: UIViewController {

  @IBOutlet private var greetingLabel: UILabel!

  override func viewDidLoad() {
    super.viewDidLoad()
    greetingLabel.text = Greeting.hello
  }
}
