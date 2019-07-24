//
//  AlertController.swift
//  MegaBox
//
//  Created by 차수연 on 24/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

extension UIAlertController {
  convenience init(title: String?, message: String?) {
    self.init(title: title, message: message, preferredStyle: .alert)
    self.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
  }
}
