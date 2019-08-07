//
//  Date.swift
//  MegaBox
//
//  Created by Fury on 08/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import Foundation

extension Date {
  func geCurrenttDate(isOnlyNumber: Bool) -> String {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ko_KR")
    let date = Date()
    if isOnlyNumber {
      formatter.dateFormat = "yyyy-MM-dd"
      let nowDateStr = formatter.string(from: date)
      
      return nowDateStr
    } else {
      formatter.dateFormat = "M월 d일(E)"
      let nowDataStr = formatter.string(from: date)
      
      return nowDataStr
    }
  }
  
  func getDayInterval(startDateStr: String, endDateStr: String) -> Int {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ko_KR")
    formatter.dateFormat = "yyyy-MM-dd"
    
    let startDate = formatter.date(from: startDateStr)!
    let endDate = formatter.date(from: endDateStr)!
    
    let interval = endDate.timeIntervalSince(startDate)
    let days = Int(interval / 86400)
    return days
  }
}
