//
//  Label.swift
//  MegaBox
//
//  Created by Fury on 05/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

extension UILabel {
  func labelConfigure(_ text: String) {
    self.text = text
    self.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
  }
}
