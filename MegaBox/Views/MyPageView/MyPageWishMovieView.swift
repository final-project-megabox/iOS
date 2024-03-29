//
//  MyPageWishMovieView.swift
//  MegaBox
//
//  Created by 차수연 on 07/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MyPageWishMovieView: UIView {
  
  var delegate: MyPageWishMovieViewDelegate?

  let shared = UserDataManager.shared
  let movieShared = MovieDataManager.shared
  
  let wishMovieListTableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  
  let footerView: MyPageFooterView = {
    let view = MyPageFooterView()
    view.backgroundColor = UIColor.appColor(.selectedCellGrayColor)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setupTableView()
    setupMovieListView()
  }
  
  
  func setupTableView() {
    wishMovieListTableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    wishMovieListTableView.separatorColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    wishMovieListTableView.tableFooterView = footerView
    
    wishMovieListTableView.dataSource = self
    
  
    wishMovieListTableView.register(MyPageWishMovieCell.self, forCellReuseIdentifier: MyPageWishMovieCell.identifier)
    
  }
  
  func setupMovieListView() {
    addSubview(wishMovieListTableView)
    wishMovieListTableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    wishMovieListTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    wishMovieListTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    wishMovieListTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    
    
    
  }
  
  @objc func didTapDeleteButton(_ sender: UIButton) {
    delegate?.touchUpDeleteButton(sender: sender, movieId: shared.wishMovieData[sender.tag].movieID)
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    
    
    
  }
  
}

extension MyPageWishMovieView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return self.shared.wishMovieData.count
    
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let wishListCell = tableView.dequeueReusableCell(withIdentifier: MyPageWishMovieCell.identifier, for: indexPath) as! MyPageWishMovieCell
    
    wishListCell.selectionStyle = .none
    
    wishListCell.deleteButton.addTarget(self, action: #selector(didTapDeleteButton(_:)), for: .touchUpInside)
    //tag
    wishListCell.tag = shared.wishMovieData[indexPath.row].movieID
    print("[tag]", wishListCell.tag)
    
    //제목
    wishListCell.movieTitleLabel.text = shared.wishMovieData[indexPath.row].title
    
    //관람등급 이미지
    if shared.wishMovieData[indexPath.row].age == "청소년 관람불가"{
      wishListCell.gradeImageView.image = #imageLiteral(resourceName: "booking_middle_filrm_rating_18")
    } else if shared.wishMovieData[indexPath.row].age == "15세 관람가" {
      wishListCell.gradeImageView.image = #imageLiteral(resourceName: "booking_middle_filrm_rating_15")
    } else  if shared.wishMovieData[indexPath.row].age == "12세 관람가" {
      wishListCell.gradeImageView.image = #imageLiteral(resourceName: "booking_middle_filrm_rating_12")
    } else if shared.wishMovieData[indexPath.row].age == "전체 관람" {
      wishListCell.gradeImageView.image = #imageLiteral(resourceName: "booking_middle_filrm_rating_all")
    } else {
      wishListCell.gradeImageView.image = #imageLiteral(resourceName: "booking_middle_filrm_rating_noage")
    }
    
    //포스터 이미지
    let url = shared.wishMovieData[indexPath.row].imgURL
    let dataURL = URL(string: url)!
    let task = URLSession.shared.dataTask(with: dataURL) { (data, response, error) in
      DispatchQueue.main.async {
        guard let data = data else { return }
        wishListCell.thumnailImageView.image = UIImage(data: data)
      }
    }
    task.resume()
    
    let id = shared.wishMovieData[indexPath.row].movieID
    let detailUrl = ApiUrlData.ApiUrl(.movieDetailApi)
    let query = "?movie=\(id)"
    let fullUrl = detailUrl + query
    
    
    NetworkService.getMovieDetailData(fullUrl) { (result) in
      switch result {
      case .success(let data):
        wishListCell.typeLabel.text = "기타/\(data.genre)"
        let date = data.releaseDate.replace(target: "-", withString: ".")
        wishListCell.dateLabel.text = "\(date)"
        wishListCell.directorLabel.text = "감독 \(data.director)"
        wishListCell.actorLabel.text = "출연 \(data.cast)"
      case .failure(let err):
        print(err.localizedDescription)
      }
    }
    
    
    
    
    wishListCell.typeLabel.text = movieShared.movieDetailData?.genre
    
    
    
    
    return wishListCell
    
  }

}
