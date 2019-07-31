//
//  MovieDataManager.swift
//  MegaBox
//
//  Created by Fury on 22/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import Foundation

class MovieDataManager {
  static let shared = MovieDataManager()
  
  private init() {}
  
  var allMovieData: [MovieData] = []
  
  var reservationMovieData: [ReservationData] = []
  
  var sortedAllMovieTitle: [String] = []
  var sortedTheaterMovieTitle: [String] = []
  var sortedTitleCount: [String: [Int]] = [:]
  
  var theaterCategoryDetailMovie = [String: [Int: [String: ReservationData]]]()
  
  var theaterCategoryMovie = [String: [ReservationData]]()
}
