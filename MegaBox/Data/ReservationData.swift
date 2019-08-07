//
//  TheaterData.swift
//  MegaBox
//
//  Created by Fury on 23/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import Foundation

// MARK: - ReservationElement
struct ReservationData: Codable {
  let scheduleID: Int
  let theater: String
  let screen: Int
  let age: String
  let runningTime: Int
  var date, startTime, movie: String
  let types: [String]
  let stCount, totalSeat: Int
  let seatNumber: [String]

  enum CodingKeys: String, CodingKey {
    case scheduleID = "schedule_id"
    case theater, screen, age
    case runningTime = "running_time"
    case date
    case startTime = "start_time"
    case movie
    case types
    case stCount = "st_count"
    case totalSeat = "total_seat"
    case seatNumber = "seat_number"
  }
}

struct ReservationPersonCount {
  let theaterNumber: Int
  let adultCount: Int
  let teenagerCount: Int
  let seniorCount: Int
}
