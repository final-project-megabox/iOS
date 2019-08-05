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
  let phoneNumber: String
  let preferTheater: [PreferTheater]
  let bookingHistory: [String]
  let watchedMovieNumber, wishMovieNumber: Int
  
  enum CodingKeys: String, CodingKey {
    case phoneNumber, preferTheater
    case bookingHistory = "booking_history"
    case watchedMovieNumber, wishMovieNumber
  }
}

// MARK: - PreferTheater
struct PreferTheater: Codable {
  let theater, region: String
  let id: Int
}



