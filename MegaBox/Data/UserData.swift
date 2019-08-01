//
//  UserData.swift
//  MegaBox
//
//  Created by 차수연 on 01/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import Foundation
// MARK: - Token
struct Token: Codable {
  let token: String
  let user: User
}

// MARK: - User
struct User: Codable {
  let username, name: String
}

// MARK: - MyPage
struct MyPage: Codable {
  let phoneNumber, preferTheater: String
  let bookingHistory: [BookingHistory]
  let watchedMovieNumber: Int
  
  enum CodingKeys: String, CodingKey {
    case phoneNumber, preferTheater
    case bookingHistory = "booking_history"
    case watchedMovieNumber
  }
}

// MARK: - BookingHistory
struct BookingHistory: Codable {
  let imgURL: String
  let title, bookingDate, theater: String
  
  enum CodingKeys: String, CodingKey {
    case imgURL = "img_url"
    case title
    case bookingDate = "booking_date"
    case theater
  }
}
