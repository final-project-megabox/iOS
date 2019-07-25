//
//  SplashViewController.swift
//  MegaBox
//
//  Created by Fury on 22/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

  private let shared = MovieDataManager.shared
  private let movieReservationURLStr = "http://megabox.hellocoding.shop//database/reservationFirstView/"
  
  private var timer: Timer!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(startSplash), userInfo: nil, repeats: false)
    
  }
  
  @objc private func startSplash() {
    NetworkService.getAllMovieData(movieReservationURLStr) { result in
      switch result {
      case .success(let data):
        self.shared.allMovieData = data
        self.shared.sortedMovieTitle = data.sorted(by: { $0.bookingRate > $1.bookingRate }).map({ $0.title })

        let mainVC = MainViewController()
        self.present(mainVC, animated: false)
      case .failure(let err):
        print(err)
      }
    }
  }
}
