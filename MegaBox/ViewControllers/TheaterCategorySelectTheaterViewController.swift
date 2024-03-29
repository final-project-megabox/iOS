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
  
  var regionData: [RegionData]?
  
  private let selectTheaterView: TheaterCategorySelectTheaterView = {
    let view = TheaterCategorySelectTheaterView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    selectTheaterView.delegate = self
    checkRegionData()
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    setupSelectTheaterView()
  }
  
  func getReservationDataAndSort(isOne: Bool, _ selectedRegionName: String, _ date: String, vc: UIViewController?) {
    let url = ApiUrlData.ApiUrl(.theaterMovieDataApi)
    NetworkService.getReservationData(url, regionName: selectedRegionName, date: date) { result in
      switch result {
      case .success(let data):
        var reservationMovieDatas = data
        self.shared.theaterCategoryMovie = [:]
        self.shared.theaterCategoryDetailMovie = [:]
        
        // 예매율 영화명으로 영화관별 예매 영화 정보를 소팅
        for (_, title) in self.shared.sortedAllMovieTitle.enumerated() {
          reservationMovieDatas = reservationMovieDatas.sorted(by: { title == $1.movie
          })
        }
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
        
        if isOne {
          self.dismiss(animated: false)
        } else {
          let today = self.getDate(isOnlyNumber: false)
          let viewController = vc as! TheaterCategoryReservationViewController
          viewController.menuView.dateButton.setTitle(today, for: .normal)
          self.present(viewController, animated: false)
        }
      case .failure(let err):
        print("[Log] :", err.localizedDescription)
      }
    }
  }
  
  private func checkRegionData() {
    var regionList: [String] = []
    var regionTheaterList: [String] = []
    
    guard let regionData = regionData else { return }
    for (_, regionData) in regionData.enumerated() {
      regionList.append(regionData.region)
      regionTheaterList.append(regionData.theater)
    }
    
    selectTheaterView.regionData = regionList
    selectTheaterView.regionTheaterData = regionTheaterList
  }
  
  private func getDate(isOnlyNumber: Bool) -> String {
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "ko_KR")
    let date = Date()
    if isOnlyNumber {
      formatter.dateFormat = "yyyy-MM-dd"
      let nowDateStr = formatter.string(from: date)
      
      return nowDateStr
    } else {
      formatter.dateFormat = "M월 d일(E)"
      let nowDataStr = formatter.string(from: date)
      
      return nowDataStr
    }
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
    // .one : 영화관별 예매에서 지역 클릭
    case .one:
      guard let selectedRegionName = selectTheaterView.movieTitleLabel.text else { return }
      let presentingVC = self.presentingViewController as! TheaterCategoryReservationViewController
      presentingVC.regionName = selectedRegionName
      guard let date = presentingVC.menuView.dateButton.accessibilityIdentifier else { return }
      
      getReservationDataAndSort(isOne: true, selectedRegionName, date, vc: nil)
      
    // .two : 영화관 선택 후 영화관별 예매 Present
    case .two:
      guard let selectedRegionName = selectTheaterView.movieTitleLabel.text else { return }
      let theaterCategoryReservationVC = TheaterCategoryReservationViewController()
      theaterCategoryReservationVC.regionName = selectedRegionName
      theaterCategoryReservationVC.menuView.dateButton.accessibilityIdentifier = getDate(isOnlyNumber: true)
      getReservationDataAndSort(isOne: false, selectedRegionName, getDate(isOnlyNumber: true), vc: theaterCategoryReservationVC)
    }
  }
  
  func touchUpCancelButton() {
    switch dismissType {
    case .one:
      let presentingVC = self.presentingViewController as! TheaterCategoryReservationViewController
      presentingVC.isCancel = true
      self.dismiss(animated: false)
    case .two:
      self.presentingViewController?.presentingViewController?.dismiss(animated: false)
    }
  }
}
