//
//  UIApplication.swift
//  MegaBox
//
//  Created by Fury on 10/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

extension UIApplication {
  var statusBarView: UIView? {
    
    if responds(to: Selector(("statusBar"))) {
      return value(forKey: "statusBar") as? UIView
    }
    return nil
  }
}
