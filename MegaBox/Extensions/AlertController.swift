//
//  AlertController.swift
//  MegaBox
//
//  Created by 차수연 on 24/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

extension UIAlertController {
  func alertController(title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
    
    alert.addAction(okAction)
    present(alert, animated: true)
  }
}
