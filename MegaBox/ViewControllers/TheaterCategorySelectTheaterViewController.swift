//
//  SelectTheaterViewController.swift
//  MegaBox
//
//  Created by Fury on 19/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

enum TheaterDismissType {
  case one
  case two
}

class TheaterCategorySelectTheaterViewController: UIViewController {
  private let shared = MovieDataManager.shared
  var dismissType: DismissType = .two
  private let urlStr: String = "http://megabox.hellocoding.shop//database/reservationScheduleList/"
  
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
    switch dismissType {
    case .one:
      
      guard let selectedRegionName = selectTheaterView.movieTitleLabel.text else { return }
      NetworkService.getReservationData(urlStr, regionName: selectedRegionName, date: "2019-07-31") { result in
        switch result {
        case .success(let data):
          self.shared.reservationMovieData = data.sorted(by: { $0.movie < $1.movie })
          self.dismiss(animated: false)
        case .failure(let err):
          print("[Log] :", err.localizedDescription)
        }
      }
    case .two:
      let theaterCategoryReservationVC = TheaterCategoryReservationViewController()
      guard let selectedRegionName = selectTheaterView.movieTitleLabel.text else { return }
      theaterCategoryReservationVC.regionName = selectedRegionName
      
      NetworkService.getReservationData(urlStr, regionName: selectedRegionName, date: "2019-07-31") { result in
        switch result {
        case .success(let data):
          var reservationMovieDatas = data
          
          // 예매율 영화명으로 소팅
          for (_, title) in self.shared.sortedAllMovieTitle.enumerated() {
            reservationMovieDatas = reservationMovieDatas.sorted(by: { title == $1.movie })
          }
          reservationMovieDatas.sort(by: { _,_ in return true })
          
          self.shared.reservationMovieData = reservationMovieDatas
          
          // 해당 영화관의 영화 정보 하나의 모델에 저장
          for (_, data) in reservationMovieDatas.enumerated() {
            if self.shared.theaterCategoryMovie[data.movie] == nil {
              self.shared.theaterCategoryMovie[data.movie] = [data]
            } else {
              self.shared.theaterCategoryMovie[data.movie]?.append(data)
            }
          }
          
          // 해당 영화관의 영화 디테일 정보 하나의 모델에 저장
          for (_, data) in reservationMovieDatas.enumerated() {
            if self.shared.theaterCategoryDetailMovie[data.movie] == nil {
              self.shared.theaterCategoryDetailMovie[data.movie] = [data.screen: [data.startTime: data]]
            } else {
              if self.shared.theaterCategoryDetailMovie[data.movie]![data.screen] == nil {
                self.shared.theaterCategoryDetailMovie[data.movie]![data.screen] = [data.startTime: data]
              } else {
                self.shared.theaterCategoryDetailMovie[data.movie]![data.screen]![data.startTime] = data
              }
            }
          }
          
          // 영화 타이틀만 저장 및 중복 제거(예매율 소팅)
          self.shared.sortedTheaterMovieTitle = reservationMovieDatas.map({ $0.movie })
          self.shared.sortedTheaterMovieTitle = self.shared.sortedTheaterMovieTitle.removeDuplicates()
          
          self.present(theaterCategoryReservationVC, animated: false)
        case .failure(let err):
          print(err.localizedDescription)
        }
      }
    }
  }
  
  func touchUpCancelButton() {
    switch dismissType {
    case .one:
      self.dismiss(animated: false)
    case .two:
      self.presentingViewController?.presentingViewController?.dismiss(animated: false)
    }
  }
}


