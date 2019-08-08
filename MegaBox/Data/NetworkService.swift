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
  
  static func getToken(email: String, pw: String, completion: @escaping (Result<Token>) -> ()) {
    let body = """
      {
      "email": "\(email)",
      "password": "\(pw)"
      }
      """.data(using: .utf8)
    
    let headers = [
      "Content-Type": "application/json"
    ]
    
    let url = "http://megabox.hellocoding.shop//accounts/login/"
    
    guard let data = body else { return }
    
    Alamofire.upload(data, to: url, method: .post, headers: headers).responseData(queue: .global()) { res in
      switch res.result {
      case .success(let value):
        guard let result = try? JSONDecoder().decode(Token.self, from: value) else {
          completion(.failure(ErrorType.NoData))
          return }
        completion(.success(result))
      case .failure(_):
        completion(.failure(ErrorType.networkErr))
      }
    }
  }
  
  static func getUserMyPageData(_ urlStr: String, completion: @escaping (Swift.Result<MyPage, ErrorType>) -> Void) {
    let url = URL(string: urlStr)!
    
    guard let token = UserDefaults.standard.value(forKey: "Token") else { return }
    
    let headers: HTTPHeaders = [
      "Content-Type": "application/json",
      "Authorization": "JWT \(token)"
    ]
    
    let req = Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)
    
    
    req.validate()
      .responseData { response in
        switch response.result {
        case .success(let data):
          do {
            let userMyPageData = try JSONDecoder().decode(MyPage.self, from: data)
            completion(.success(userMyPageData))
          } catch {
            print(error.localizedDescription)
          }
        case .failure:
          completion(.failure(ErrorType.networkErr))
        }
    }
  }
  
  
  static func getAllMovieData(_ urlStr: String, completion: @escaping (Swift.Result<[MovieData], ErrorType>) -> Void) {
    let url = URL(string: urlStr)!
    
    let token = UserDefaults.standard.string(forKey: "Token")
  
    if token != nil {
      let headers = [
        "Content-Type": "application/json",
        "Authorization": "JWT \(token!)"
      ]
      
      let req = Alamofire.request(url, method: .get, headers: headers)
      
      req.validate(statusCode: 200...299)
        .responseData { response in
          switch response.result {
          case .success(let data):
              guard let allMovieData = try? JSONDecoder().decode([MovieData].self, from: data) else {
                completion(.failure(.NoData))
                return }
              completion(.success(allMovieData))
          case .failure:
            completion(.failure(.networkErr))
          }
      }
    } else if token == nil {
      let req = Alamofire.request(url)
      
      req.validate(statusCode: 200...299)
        .responseData { response in
          switch response.result {
          case .success(let data):
            guard let allMovieData = try? JSONDecoder().decode([MovieData].self, from: data) else {
              completion(.failure(.NoData))
              return }
            print("log2 noToken success")
            print("log2 NoTokenData: ", allMovieData)
            completion(.success(allMovieData))
          case .failure:
            completion(.failure(.networkErr))
          }
      }
      
    }
    
  }
  

  static func getMovieDetailData(_ urlStr: String, completion: @escaping (Swift.Result<MovieDetailData, ErrorType>) -> Void) {
    let url = URL(string: urlStr)!
  
    guard let token = UserDefaults.standard.value(forKey: "Token") else { return }
    
    let headers: HTTPHeaders = [
      "Content-Type": "application/json",
      "Authorization": "JWT \(token)"
    ]
    
    let req = Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)
    
    
    
    req.validate()
      .responseData { response in
        switch response.result {
        case .success(let data):
          do {
            let movieDetailData = try JSONDecoder().decode(MovieDetailData.self, from: data)
          completion(.success(movieDetailData))
          } catch {
            
          }
        case .failure:
          completion(.failure(ErrorType.NoData))
        }
    }
  }
  
  static func getReservationData(_ urlStr: String, regionName: String, date: String, completion: @escaping (Swift.Result<[ReservationData], ErrorType>) -> Void) {
    let url = URL(string: urlStr)!
    let parameters: [String: String] = ["theater": regionName, "date": date]
    
    let req = Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default)
    
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
  
  static func pushSeatReservationData(_ urlStr: String, scheduleId: Int, seatNumber: [String], price: Int, seatCount: Int, compleition: @escaping (Swift.Result<String, ErrorType>) -> Void) {
    
    guard let token = UserDefaults.standard.value(forKey: "Token") else { return }
    
    let headers = [
      "Content-Type": "application/json",
      "Authorization": "JWT \(token)"
    ]
    
    var seatNumberStr = ""
    
    for (idx, seat) in seatNumber.enumerated() {
      let count = seatNumber.count
      if (count - 1) == idx {
        seatNumberStr.append("\(seat)")
      } else {
        seatNumberStr.append("\(seat), ")
      }
    }
    
    let body = """
      {
      "schedule_id": "\(scheduleId)",
      "seat_number": [
      "\(seatNumberStr)"
      ],
      "price": "\(price)",
      "st_count": "\(seatCount)"
      }
      """.data(using: .utf8)
    
    guard let data = body else { return }
    
    let url = URL(string: urlStr)!
    
    let req = Alamofire.upload(data, to: url, method: .post, headers: headers)
    
    req.validate()
      .responseData { response in
        switch response.result {
        case .success:
          compleition(.success("OK"))
        case .failure:
          compleition(.failure(ErrorType.networkErr))
        }
    }
  }
  
  static func pushIsWished(_ urlStr: String, movieId: Int) {
    
    guard let token = UserDefaults.standard.value(forKey: "Token") else { return }
    
    let headers = [
      "Content-Type": "application/json",
      "Authorization": "JWT \(token)"
    ]
    
    let body = """
      {
      "movie_id": "\(movieId)"
      }
      """.data(using: .utf8)
    
    guard let data = body else { return }
    
    let url = URL(string: urlStr)!
    
    let req = Alamofire.upload(data, to: url, method: .post, headers: headers)
    
    
    
    req.validate()
  
  }
  
  static func getUserWishMovie(_ urlStr: String, completion: @escaping (Swift.Result<[WishMovie], ErrorType>) -> Void) {
    let url = URL(string: urlStr)!
    guard let token = UserDefaults.standard.value(forKey: "Token") else { return }
    
    let headers: HTTPHeaders = [
      "Content-Type": "application/json",
      "Authorization": "JWT \(token)"
    ]
    
    let req = Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)
    
    
    req.validate()
      .responseData { response in
        switch response.result {
        case .success(let data):
          do {
            print(data)
            let userWishMovie = try JSONDecoder().decode([WishMovie].self, from: data)
            completion(.success(userWishMovie))
          } catch {
            print(error.localizedDescription)
          }
        case .failure:
          completion(.failure(ErrorType.networkErr))
        }
    }
  }
  
  static func getRegionData(completion: @escaping (Result<[RegionData]>) -> ()) {
    let urlStr =  ApiUrlData.ApiUrl(.regionDataApi)
    let url = URL(string: urlStr)!
    
    let req = Alamofire.request(url)
    req.validate()
      .responseData { response in
        switch response.result {
        case .success(let data):
          do {
            let regionData = try JSONDecoder().decode([RegionData].self, from: data)
            completion(.success(regionData))
          } catch {
            completion(.failure(ErrorType.networkErr))
          }
        case .failure:
          completion(.failure(ErrorType.NoData))
        }
    }
  }
  
}
