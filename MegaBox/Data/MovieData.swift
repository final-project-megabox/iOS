// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:

import Foundation

// MARK: - MovieData
struct MovieData: Codable {
  let movieID: Int
  let imgURL: String
  let releaseDate: String
  let bookingRate: Double
  let title, age: String
  let types: [[String]]
  let runningTime: Int
  let selected: Bool
  let isWished: Bool
  
  enum CodingKeys: String, CodingKey {
    case movieID = "movie_id"
    case imgURL = "img_url"
    case releaseDate = "release_date"
    case bookingRate = "booking_rate"
    case title, age, types
    case runningTime = "running_time"
    case selected
    case isWished = "is_wished"
  }
}

enum TypeElement: String, Codable {
  case atmos = "ATMOS"
  case the3D = "3D"
  case 더빙 = "더빙"
  case 디지털 = "디지털"
  case 자막 = "자막"
}

