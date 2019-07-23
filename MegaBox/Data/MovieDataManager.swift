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
  var sortedReservationMovie: [ReservationData] = []
}
