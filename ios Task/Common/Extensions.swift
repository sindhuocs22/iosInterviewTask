//
//  Extensions.swift
//  ios Task
//
//  Created by INFOSYS on 20/02/20.
//  Copyright © 2020 INFOSYS. All rights reserved.
//

import UIKit

extension UITableView {

  func setEmptyMessage(_ message: String) {
    let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
    messageLabel.text = message
    messageLabel.textColor = .black
    messageLabel.numberOfLines = 0
    messageLabel.textAlignment = .center
    messageLabel.font = UIFont.systemFont(ofSize: 11)
    messageLabel.sizeToFit()

    self.backgroundView = messageLabel
  }

  func restore() {
    self.backgroundView = nil
  }
}
