//
//  AlertController.swift
//  MegaBox
//
//  Created by 차수연 on 24/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

extension UIAlertController {
  class func show(title:String?, message: String, from controller: UIViewController) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "확인", style: .default))
    controller.show(alert, sender: nil)
  }
  
  class func cancelShow(title:String?, message: String, from controller: UIViewController, action: @escaping (UIAlertAction) -> Void) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//    alert.addAction(UIAlertAction(title: "확인", style: .default))
    alert.addAction(UIAlertAction(title: "확인", style: .default, handler: action))
    alert.addAction(UIAlertAction(title: "취소", style: .cancel))
    controller.show(alert, sender: nil)
  }
}
