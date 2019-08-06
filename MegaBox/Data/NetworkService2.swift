//
//  NetworkService2.swift
//  MegaBox
//
//  Created by Fury on 06/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import Foundation
import Alamofire

class NetworkService2 {
  
  enum ErrorType: Error {
    case networkErr, NoData
  }
  
  static func getRegionData(completion: @escaping (Result<[RegionData]>) -> ()) {
    let urlStr = "http://megabox.hellocoding.shop//database/showregion/"
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
