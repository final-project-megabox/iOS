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
  
  let headerView = TheaterCategoryReservationHeaderView()
  
  private var movieCount: Int = 0
  
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
    tableView.register(TheaterCategorySectionCell.self, forCellReuseIdentifier: TheaterCategoryCell.identifier)
    tableView.register(TheaterCategoryCell.self, forCellReuseIdentifier: TheaterCategoryCell.identifier)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    theaterTableView.dataSource = self
    theaterTableView.delegate = self
    
    setupProperties()
  }
  
  @objc private func touchUpMenuTitleDismissButton(_ sender: UIButton) {
    delegate?.touchUpMenuTitleDismissButton(sender)
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
    let movieCount = shared.reservationMovieData.count
    let titleCount = shared.sortedMovieTitle.count
    return movieCount + titleCount
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: TheaterCategoryCell.identifier, for: indexPath) as! TheaterCategoryCell
    
    return cell
  }
}

extension TheaterCategoryReservationView: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
  
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
