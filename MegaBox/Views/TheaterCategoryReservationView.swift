//
//  TheaterCategoryReservationView.swift
//  MegaBox
//
//  Created by Fury on 16/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class TheaterCategoryReservationView: UIView {
  
  let headerView = TheaterCategoryReservationHeaderView()
  
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
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupProperties()
  }
  
  private func setupProperties() {
    theaterTableView.dataSource = self
    theaterTableView.delegate = self
    theaterTableView.register(TheaterCategoryCell.self, forCellReuseIdentifier: TheaterCategoryCell.identifier)
    
    self.addSubview(menuTitleView)
    menuTitleView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    menuTitleView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
    menuTitleView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    menuTitleView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    
    menuTitleView.addSubview(menuTitleLabel)
    menuTitleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
    menuTitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    menuTitleLabel.centerYAnchor.constraint(equalTo: menuTitleView.centerYAnchor).isActive = true
    menuTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    
    menuTitleView.addSubview(menuTitleDismissButton)
    menuTitleDismissButton.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
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
    return 20
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
    print("[Log] contentOffset.y :", scrollView.contentOffset.y)
    if scrollView.contentOffset.y <= scrollHeaderHeight {
      if scrollView.contentOffset.y >= 0 {
        scrollView.contentInset = UIEdgeInsets(top: -scrollView.contentOffset.y, left: 0, bottom: 0, right: 0)
      }
    }
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return nil
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
    return headerView
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return (UIScreen.main.bounds.width * 495) / 844
  }
}
