//
//  String.swift
//  MegaBox
//
//  Created by 차수연 on 05/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import Foundation

extension String {
  func replace(target: String, withString: String) -> String {
    return self.replacingOccurrences(of: target,
                                     with: withString,
                                     options: NSString.CompareOptions.literal,
                                     range: nil)
    
  }
}
