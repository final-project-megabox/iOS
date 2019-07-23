//
//  NetworkService.swift
//  MegaBox
//
//  Created by Fury on 19/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import Foundation
import Alamofire

class NetworkService {
  
  enum ErrorType: Error {
    case networkErr, NoData
  }
  
  static func getAllMovieData(_ urlStr: String, completion: @escaping (Swift.Result<[MovieData], ErrorType>) -> Void) {
    let url = URL(string: urlStr)!
    let req = Alamofire.request(url)
    
    req.validate()
      .responseData { response in
        switch response.result {
        case .success(let data):
          do {
            let allMovieData = try JSONDecoder().decode([MovieData].self, from: data)
            completion(.success(allMovieData))
          } catch {
            print(error.localizedDescription)
          }
        case .failure:
          completion(.failure(.NoData))
        }
    }
  }
  
  static func getReservationData(_ urlStr: String, regionName: String, date: String, completion: @escaping (Swift.Result<[ReservationData], ErrorType>) -> Void) {
    let url = URL(string: urlStr)!
    let parameters: [String: String] = ["theater": regionName, "date": date]
    
    let req = Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: nil)
    
    req.validate()
      .responseData { response in
        switch response.result {
        case .success(let data):
          do {
            let allReservationData = try JSONDecoder().decode([ReservationData].self, from: data)
            completion(.success(allReservationData))
          } catch {
            print(error.localizedDescription)
          }
        case .failure:
          completion(.failure(ErrorType.networkErr))
        }
    }
  }
}
