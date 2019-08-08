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
  let user: String
  let name: String
}

// MARK: - MyPage
struct MyPage: Codable {
  let phoneNumber: String
  let preferTheater: [PreferTheater]
  let bookingHistory: [BookingHistory]
  let watchedMovieNumber, wishMovieNumber, mileage: Int
  
  enum CodingKeys: String, CodingKey {
    case phoneNumber, preferTheater
    case bookingHistory = "booking_history"
    case watchedMovieNumber, wishMovieNumber, mileage
  }
}

// MARK: - BookingHistory
struct BookingHistory: Codable {
  let imgURL: String
  let title: String
  let bookingDate, theater: String
  
  enum CodingKeys: String, CodingKey {
    case imgURL = "img_url"
    case title
    case bookingDate = "booking_date"
    case theater
  }
}
// MARK: - PreferTheater
struct PreferTheater: Codable {
  let theater, region: String
  let id: Int
}


// MARK: - WishMovie
struct WishMovie: Codable {
  let movieID: Int
  let imgURL: String
  let age: String
  let title: String
  let bookingRate: Double
  
  enum CodingKeys: String, CodingKey {
    case movieID = "movie_id"
    case imgURL = "img_url"
    case age, title
    case bookingRate = "booking_rate"
  }
}
