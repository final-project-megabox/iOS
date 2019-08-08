//
//  MyPageWatchedContentView.swift
//  MegaBox
//
//  Created by 차수연 on 08/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MyPageWatchedContentView: UIView {
  
  let shared = UserDataManager.shared

  let headerView: MyPageWatchedHeaderView = {
    let view = MyPageWatchedHeaderView()
    view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 200)
    return view
  }()
  
  let watchedMovieTableView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .grouped)
    tableView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupTableView()
    setupContentView()
    

  }
  
  func setupTableView() {
    
    watchedMovieTableView.tableHeaderView = headerView
    watchedMovieTableView.dataSource = self
    
    watchedMovieTableView.register(MyPageWatchedMovieCell.self, forCellReuseIdentifier: MyPageWatchedMovieCell.identifier)
  }
  
  func setupContentView() {
    addSubview(watchedMovieTableView)
    watchedMovieTableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    watchedMovieTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    watchedMovieTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    watchedMovieTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension MyPageWatchedContentView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return shared.watchedMovieData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MyPageWatchedMovieCell.identifier, for: indexPath) as! MyPageWatchedMovieCell
    
    cell.selectionStyle = .none
    
    //포스터 이미지
    let url = shared.watchedMovieData[indexPath.row].imgURL
    let dataURL = URL(string: url)!
    let task = URLSession.shared.dataTask(with: dataURL) { (data, response, error) in
      DispatchQueue.main.async {
        guard let data = data else { return }
        cell.movieImageView.image = UIImage(data: data)
      }
    }
    task.resume()
    
    if shared.watchedMovieData[indexPath.row].age == "전체 관람" {
      cell.gradeImageView.image = #imageLiteral(resourceName: "booking_middle_filrm_rating_all")
    } else if shared.watchedMovieData[indexPath.row].age == "15세 관람가" {
      cell.gradeImageView.image = #imageLiteral(resourceName: "booking_middle_filrm_rating_15")
    } else if shared.watchedMovieData[indexPath.row].age == "12세 관람가" {
      cell.gradeImageView.image = #imageLiteral(resourceName: "booking_middle_filrm_rating_12")
    } else if shared.watchedMovieData[indexPath.row].age == "청소년 관람불가" {
      cell.gradeImageView.image = #imageLiteral(resourceName: "booking_middle_filrm_rating_18")
    } else {
      cell.gradeImageView.image = #imageLiteral(resourceName: "booking_middle_filrm_rating_noage")
    }
    
    cell.titleLabel.text = shared.watchedMovieData[indexPath.row].title
    cell.dateLabel.text = shared.watchedMovieData[indexPath.row].scheduleDate
    cell.theaterLabel.text = shared.watchedMovieData[indexPath.row].theaterHeadcount
    
    
    
    return cell
  }
  
  
}
