//
//  MovieData.swift
//  MegaBox
//
//  Created by Fury on 19/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import Foundation

struct Movie: Decodable {
  var movies: [MovieData]
}

struct MovieData: Decodable {
  var movieID: Int
  var imageURL: String
  var releaseDate: String
  var bookingRate: Int
  var title: String
  var age: Int
  var type: [String]
  
  enum CodingKeys: String, CodingKey {
    case movieID = "movie_id"
    case imageURL = "img_url"
    case releaseDate = "release_date"
    case bookingRate = "booking_rate"
    case title
    case age
    case type
  }
}
