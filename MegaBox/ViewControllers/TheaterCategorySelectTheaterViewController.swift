//
//  SelectTheaterViewController.swift
//  MegaBox
//
//  Created by Fury on 19/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class TheaterCategorySelectTheaterViewController: UIViewController {
  private let shared = MovieDataManager.shared
  private let urlStr: String = "http://megabox.hellocoding.shop//database/reservationFirstView/"
  
  private let selectTheaterView: TheaterCategorySelectTheaterView = {
    let view = TheaterCategorySelectTheaterView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    selectTheaterView.delegate = self
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    setupSelectTheaterView()
  }
  
  private func setupSelectTheaterView() {
    let guide = view.safeAreaLayoutGuide
    
    view.addSubview(selectTheaterView)
    selectTheaterView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    selectTheaterView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    selectTheaterView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    selectTheaterView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
}

extension TheaterCategorySelectTheaterViewController: TheaterCategorySelectTheaterViewDelegate {
  func touchUpmenuTitleSelectbutton() {
    let theaterCategoryReservationVC = TheaterCategoryReservationViewController()
    guard let selectedRegionName = selectTheaterView.movieTitleLabel.text else { return }
    theaterCategoryReservationVC.regionName = selectedRegionName
    
    NetworkService.getReservationData(urlStr, regionName: selectedRegionName, date: "2019-07-20") { result in
      switch result {
      case .success(let data):
        self.shared.reservationMovieData = data.sorted(by: { $0.movie < $1.movie })
        
        let movies = self.shared.reservationMovieData
        let titles = self.shared.sortedMovieTitle
        var movieCounts: [String: Int] = [:]
        
        // 영화 데이터 갯수 구하는 로직
        for i in 0..<movies.count { 
          for j in 0..<titles.count {
            if movies[i].movie == titles[j] {
              if movieCounts[movies[i].movie] == nil {
                movieCounts[movies[i].movie] = 1
              } else {
                var value = movieCounts[movies[i].movie]!
                value += 1
                movieCounts[movies[i].movie] = value
              }
            }
          }
        }
        
        self.shared.movieCounts = movieCounts
        
        self.present(theaterCategoryReservationVC, animated: false)
      case .failure(let err):
        print(err.localizedDescription)
      }
    }
  }
 
  func touchUpCancelButton() {
  self.presentingViewController?.presentingViewController?.dismiss(animated: false)
  }
}


