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
    
    let url = "http://megabox.hellocoding.shop//api/token/"
    
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
  
  
  
  static func getUserMyPageData(_ urlStr: String, token: String, completion: @escaping (Swift.Result<MyPage, ErrorType>) -> Void) {
    let url = URL(string: urlStr)!
    
    let headers = [
      "Content-Type": "application/json",
      "Authorization": token
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
}
