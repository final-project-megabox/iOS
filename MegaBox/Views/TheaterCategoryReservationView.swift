//
//  TheaterCategoryReservationView.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class TheaterCategoryReservationView: UIView {
  private let shared = MovieDataManager.shared
  var delegate: TheaterCategoryReservationViewDelegate?
  
  private var tableViewMovieData = [[ReservationData]]()
  
  let headerView = TheaterCategoryReservationHeaderView()
  
  private var movieTitleIdx: Int = 0
  private var screenArr: [Int] = []
  
  private var indexPath: Int = 0
  private var movie: String = ""
  
  private var checkTttle: String = ""
  private var checkIdx: Int = 0
  
  
  private let menuTitleView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  private let menuTitleDismissButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setImage(#imageLiteral(resourceName: "common_btn_topbar_prev2"), for: .normal)
    button.contentMode = .scaleAspectFit
    button.addTarget(self, action: #selector(touchUpMenuTitleDismissButton(_:)), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let menuTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "영화관별 예매"
    label.textAlignment = .center
    label.font = UIFont.boldSystemFont(ofSize: 16)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let theaterTableView: UITableView = {
    let tableView = UITableView()
    tableView.register(TheaterCategorySectionCell.self, forCellReuseIdentifier: TheaterCategorySectionCell.identifier)
    tableView.register(TheaterCategoryCell.self, forCellReuseIdentifier: TheaterCategoryCell.identifier)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.allowsSelection = false
    return tableView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    theaterTableView.dataSource = self
    theaterTableView.delegate = self
    
    setupProperties()
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    calculateMoviesData()
    makeTableViewMovieData()
  }
  
  
  
  func makeTableViewMovieData() {
    tableViewMovieData = []
    let movieTitle = shared.sortedTheaterMovieTitle.removeDuplicates()
    for (_, title) in movieTitle.enumerated() {
      let fakeData = ReservationData(scheduleID: 0, theater: "fake", screen: 0, age: "fake", runningTime: 0, date: "fake", startTime: "fake", movie: "fake", types: ["fake"], stCount: 0, totalSeat: 0, seatNumber: ["fake"])
      tableViewMovieData.append([fakeData])
      
      let movieData = shared.theaterCategoryDetailMovie[title]!.sorted(by: { arg0, arg1 in
        arg0.key < arg1.key
      }).map({ $0.value }).map({ $0.map({ $0.value }) })
      
      for (_, data) in movieData.enumerated() {
        tableViewMovieData.append(data)
      }
    }
    theaterTableView.reloadData()
  }
  
  @objc private func touchUpMenuTitleDismissButton(_ sender: UIButton) {
    delegate?.touchUpMenuTitleDismissButton(sender)
  }
  
  func calculateMoviesData() {
    screenArr = []
    for (_, data) in shared.sortedTheaterMovieTitle.enumerated() {
      screenArr.append(shared.theaterCategoryDetailMovie[data]!.count)
    }
    
    // 영화 타이틀만 저장 및 중복 제거(예매율 소팅)
    self.shared.sortedTheaterMovieTitle = self.shared.reservationMovieData.map({ $0.movie })
    self.shared.sortedTheaterMovieTitle = self.shared.sortedTheaterMovieTitle.removeDuplicates()
    
    var sumIdx = 0
    
    for (_, count) in screenArr.enumerated() {
      for _ in 0..<count {
        shared.sortedTheaterMovieTitle.insert(shared.sortedTheaterMovieTitle[sumIdx], at: sumIdx)
      }
      sumIdx += count + 1
    }
    
    for (idx, data) in screenArr.enumerated() {
      if idx == 0 {
        screenArr[idx] = data + 1
      } else {
        screenArr[idx] = screenArr[idx - 1] + data + 1
      }
    }
    screenArr.insert(0, at: 0)
    screenArr.removeLast()
  }
  
  private func setupProperties() {
    self.addSubview(menuTitleView)
    menuTitleView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    menuTitleView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    menuTitleView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    
    self.addSubview(menuTitleLabel)
    menuTitleLabel.topAnchor.constraint(equalTo: menuTitleView.topAnchor, constant: 15).isActive = true
    menuTitleLabel.centerXAnchor.constraint(equalTo: menuTitleView.centerXAnchor).isActive = true
    menuTitleLabel.centerYAnchor.constraint(equalTo: menuTitleView.centerYAnchor).isActive = true
    menuTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    self.addSubview(menuTitleDismissButton)
    menuTitleDismissButton.leadingAnchor.constraint(equalTo: menuTitleView.leadingAnchor).isActive = true
    menuTitleDismissButton.centerYAnchor.constraint(equalTo: menuTitleView.centerYAnchor).isActive = true
    
    self.addSubview(theaterTableView)
    theaterTableView.topAnchor.constraint(equalTo: menuTitleView.bottomAnchor).isActive = true
    theaterTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    theaterTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    theaterTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension TheaterCategoryReservationView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let titleCount = shared.sortedTheaterMovieTitle.count
    
    return titleCount
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    movie = shared.sortedTheaterMovieTitle[indexPath.row]
    
    if indexPath.row == 0 || screenArr.contains(indexPath.row) {
      
      let cell = tableView.dequeueReusableCell(withIdentifier: TheaterCategorySectionCell.identifier, for: indexPath) as! TheaterCategorySectionCell
      
      // 영화관별 예매 섹션 선택 Delegate
      cell.delegate = self
      
      let grade = shared.theaterCategoryMovie[movie]![0].age
      
      var gradeImage = #imageLiteral(resourceName: "booking_middle_filrm_rating_all")
      if grade == "전체 관람" {
        gradeImage = #imageLiteral(resourceName: "booking_middle_filrm_rating_all")
      } else if grade == "12세 관람가" {
        gradeImage = #imageLiteral(resourceName: "booking_middle_filrm_rating_12")
      } else if grade == "15세 관람가" {
        gradeImage = #imageLiteral(resourceName: "booking_middle_filrm_rating_15")
      } else {
        gradeImage = #imageLiteral(resourceName: "booking_middle_filrm_rating_18")
      }
      
      cell.cellConfigure(gradeImage, movie)
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: TheaterCategoryCell.identifier, for: indexPath) as! TheaterCategoryCell
      // 영화관별 예매 Time 선택 Delegate
      cell.delegate = self
      
      let sortedData = tableViewMovieData[indexPath.row]
      let title = ("\(sortedData[0].screen)관 \(sortedData[0].totalSeat)석 | \(sortedData[0].types[0])")
      
      cell.cellConfigure(title: title, movieData: sortedData)
      return cell
    }
  }
}

extension TheaterCategoryReservationView: UITableViewDelegate {
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    // 해더뷰 고정 해제
    let scrollHeaderHeight = ((UIScreen.main.bounds.width * 495) / 844) - 50
    if scrollView.contentOffset.y <= scrollHeaderHeight {
      if scrollView.contentOffset.y >= 0 {
        scrollView.contentInset = UIEdgeInsets(top: -scrollView.contentOffset.y, left: 0, bottom: 0, right: 0)
      }
    } else if scrollView.contentOffset.y > scrollHeaderHeight {
      scrollView.contentInset = UIEdgeInsets(top: -scrollHeaderHeight, left: 0, bottom: 0, right: 0)
    }
  }
  
  // Tableview Header
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    return headerView
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return (UIScreen.main.bounds.width * 495) / 844
  }
}

extension TheaterCategoryReservationView: TheaterCategorySectionCellDelegate {
  func touchUpMovieTitle() {
    delegate?.sendTitleData()
  }
}

extension TheaterCategoryReservationView: TheaterCategoryCellDelegate {
  func touchUpMovieTime(_ data: ReservationData) {
   delegate?.sendMovieData(data)
  }
}
