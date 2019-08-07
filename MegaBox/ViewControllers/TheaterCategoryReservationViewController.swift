//
//  TheaterCategoryReservationViewController.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//
import UIKit

class TheaterCategoryReservationViewController: UIViewController {
  // MARK:- Properties
  private let urlStr: String = "http://megabox.hellocoding.shop//database/reservationScheduleList/"
  
  private var timer: Timer!
  private var isFirst = true
  var isCancel = false
  
  private let shared = MovieDataManager.shared
  
  var numPages: Int = 0
  var regionName: String = ""
  
  let menuView: TheaterCategoryReservationView = {
    let view = TheaterCategoryReservationView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // MARK:- Life Cycles
  // MARK: viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    menuView.delegate = self
    menuView.headerView.delegate = self
    
    setupMenuView()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    if isFirst {
      isFirst.toggle()
    } else {
      if !isCancel {
        menuView.calculateMoviesData()
        menuView.makeTableViewMovieData()
      }
    }
    numPages = 0
    startAdAnimation()
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    
    endAdAnimation()
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    menuView.placeButton.setTitle(regionName, for: .normal)
  }
  
  // MARK:- Methods
  func getReservationDataAndSort(_ selectedRegionName: String, _ date: String, vc: UIViewController?) {
    NetworkService.getReservationData(urlStr, regionName: selectedRegionName, date: date) { result in
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
        
        self.menuView.calculateMoviesData()
        self.menuView.makeTableViewMovieData()
        self.menuView.theaterTableView.reloadData()
      case .failure(let err):
        print("[Log] :", err.localizedDescription)
      }
    }
  }
  
  // MARK: startAdAnimation
  private func startAdAnimation() {
    timer = Timer.scheduledTimer(
      timeInterval: 3,
      target: self,
      selector: #selector(adAnimation),
      userInfo: nil,
      repeats: true
    )
    timer.fire()
  }
  
  private func endAdAnimation() {
    timer.invalidate()
  }
  
  // MARK: adAnimation
  @objc private func adAnimation() {
    menuView.headerView.adCollectionView.scrollToItem(at: IndexPath(item: numPages, section: 0), at: .centeredHorizontally, animated: true)
    if numPages == 4 {
      numPages = 0
    } else {
      numPages += 1
    }
  }
  
  // MARK: setupMenuView
  private func setupMenuView() {
    let guide = view.safeAreaLayoutGuide
    view.addSubview(menuView)
    menuView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    menuView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    menuView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    menuView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
}

extension TheaterCategoryReservationViewController: TheaterCategoryReservationViewDelegate {
  func touchUpDateTableView(_ dateStr: String, _ region: String) {
    getReservationDataAndSort(region, dateStr, vc: nil)
  }
  
  func sendTitleData() {
    print("TheaterCategoryReservationViewController[96Line] - titleDelegate")
  }
  
  func sendMovieData(_ data: ReservationData) {
    let selectSeatVC = SelectSeatViewController()
    selectSeatVC.movieData = data
    selectSeatVC.movieTheaterNumber = data.totalSeat
    self.present(selectSeatVC, animated: true)
  }
  
  func touchUpMovieTime() {
    let selectSeatVC = SelectSeatViewController()
    present(selectSeatVC, animated: true)
  }
  
  
  func touchUpMenuTitleDismissButton(_ sender: UIButton) {
    self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: false)
  }
}

extension TheaterCategoryReservationViewController: TheaterCategoryReservationHeaderViewDelegate {
  
  func touchUpPlaceButton() {
    let theaterCategorySelectTheaterVC = TheaterCategorySelectTheaterViewController()
    theaterCategorySelectTheaterVC.dismissType = .one
    self.present(theaterCategorySelectTheaterVC, animated: false)
  }
  
  func touchUpDateButton() {
    menuView.bgBottomView.isHidden.toggle()
    menuView.dateTableView.isHidden.toggle()
    
    var dateArr: [String] = []
    var fullDateArr: [String] = []
    var allFullDateArr: [String] = []
    
    let formatter = DateFormatter()
    let formatter2 = DateFormatter()
    let formatter3 = DateFormatter()
    formatter.locale = Locale(identifier: "ko_KR")
    formatter2.locale = Locale(identifier: "ko_KR")
    formatter3.locale = Locale(identifier: "ko_KR")
    formatter.dateFormat = "yyyy-MM"
    
    let date = Date()
    
    let yearAndMonth = formatter.string(from: date)
    dateArr.append(yearAndMonth)
    fullDateArr.append(yearAndMonth)
    allFullDateArr.append(yearAndMonth)
    
    for i in 0..<5 {
      formatter.dateFormat = "E dd"
      formatter2.dateFormat = "M월 d일(E)"
      formatter3.dateFormat = "yyyy-MM-dd"
      let dataStr = formatter.string(from: Calendar.current.date(byAdding: .day, value: i, to: date)!)
      
      let fullDateStr = formatter2.string(from: Calendar.current.date(byAdding: .day, value: i, to: date)!)
      
      let allFullDateStr = formatter3.string(from: Calendar.current.date(byAdding: .day, value: i, to: date)!)
      
      dateArr.append(dataStr)
      fullDateArr.append(fullDateStr)
      allFullDateArr.append(allFullDateStr)
    }
    
    menuView.dateTableData = dateArr
    menuView.fullDate = fullDateArr
    menuView.fullAllDate = allFullDateArr
    menuView.dateTableView.reloadData()
  }
}
