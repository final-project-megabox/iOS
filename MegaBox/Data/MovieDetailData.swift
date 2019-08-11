//
//  MovieDetailData.swift
//  MegaBox
//
//  Created by 차수연 on 04/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import Foundation

// MARK: - MovieDetailData
struct MovieDetailData: Codable {
  let imgURL, thumbnailURL: String
  let title, age: String
  let bookingRate: Double
  let types: [[String]]
  let releaseDate, director, cast, genre: String
  let movieDetailDataDescription: String
  
  enum CodingKeys: String, CodingKey {
    case imgURL = "img_url"
    case thumbnailURL = "thumbnail_url"
    case title, age
    case bookingRate = "booking_rate"
    case types
    case releaseDate = "release_date"
    case director, cast, genre
    case movieDetailDataDescription = "description"
  }
}
