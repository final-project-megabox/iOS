// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let movie = try? newJSONDecoder().decode(Movie.self, from: jsonData)

import Foundation

// MARK: - MovieData
struct MovieData: Codable {
  let movieID: Int
  let imgURL: String
  let releaseDate: String
  let bookingRate: Double
  let title: String
  let age: Int
  let type: [String]
  
  enum CodingKeys: String, CodingKey {
    case movieID = "movie_id"
    case imgURL = "img_url"
    case releaseDate = "release_date"
    case bookingRate = "booking_rate"
    case title, age, type
  }
}
