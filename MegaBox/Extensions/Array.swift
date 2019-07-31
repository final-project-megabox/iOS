//
//  Array.swift
//  MegaBox
//
//  Created by Fury on 31/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

extension Array where Element: Hashable {
  func removeDuplicates() -> [Element] {
    var addedDict = [Element: Bool]()
    return filter({ addedDict.updateValue(true, forKey: $0) == nil })
  }
}
