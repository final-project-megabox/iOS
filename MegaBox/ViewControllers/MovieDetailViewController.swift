//
//  MovieDetailViewController.swift
//  MegaBox
//
//  Created by 차수연 on 04/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
  
  private let shared = MovieDataManager.shared
  private let movieReservationURLStr = "http://megabox.hellocoding.shop//database/showMovies/"
  private let url = "http://megabox.hellocoding.shop/database/checkwish/"
  var movieId: Int = 0
  var isWished: Bool?
  
  let topView: MovieDetailTopView = {
    let view = MovieDetailTopView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let detailContentView: MovieDetailView = {
    let view = MovieDetailView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    getMovieDetailData()
    detailContentView.headerView.delegate = self
    topView.delegate = self
    view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    setupDetailView()
  }

  
  func getMovieDetailData() {
    guard let data = shared.movieDetailData else { return }
    detailContentView.headerView.titleLabelOfPreView.text = data.title
    detailContentView.headerView.title.text = data.title
    
    let date = data.releaseDate.replace(target: "-", withString: ".")
    
    
    detailContentView.headerView.releaseDate.text = "\(date) 개봉"
    detailContentView.headerView.genre.text = data.genre
    
    if data.age == "청소년 관람불가" {
      detailContentView.headerView.gradeImageView.image = #imageLiteral(resourceName: "booking_middle_filrm_rating_18")
    } else if data.age == "12세 관람가" {
      detailContentView.headerView.gradeImageView.image = #imageLiteral(resourceName: "booking_middle_filrm_rating_12")
    } else if data.age == "15세 관람가" {
      detailContentView.headerView.gradeImageView.image = #imageLiteral(resourceName: "booking_middle_filrm_rating_15")
    } else if data.age == "전체 관람"{
      detailContentView.headerView.gradeImageView.image = #imageLiteral(resourceName: "booking_middle_filrm_rating_all")
    } else {
      detailContentView.headerView.gradeImageView.image = #imageLiteral(resourceName: "booking_middle_filrm_rating_noage")
    }
    
    
    
    let url = data.imgURL
    let dataURL = URL(string: url)!
    let task = URLSession.shared.dataTask(with: dataURL) { (data, response, error) in
      DispatchQueue.main.async {
        guard let data = data else { return }
        self.detailContentView.headerView.thumbnailImageView.image = UIImage(data: data)
      }
    }
    task.resume()
    
    let url2 = data.thumbnailURL
    let dataURL2 = URL(string: url2)!
    let task2 = URLSession.shared.dataTask(with: dataURL2) { (data, response, error) in
      DispatchQueue.main.async {
        guard let data = data else { return }
        self.detailContentView.headerView.preView.image = UIImage(data: data)
      }
    }
    task2.resume()
    
    //보고싶어 button Color
    self.detailContentView.headerView.likeButton.isSelected = self.isWished!
    if self.isWished! == true {
      self.detailContentView.headerView.likeButton.setTitleColor(UIColor.appColor(.selectedCellMintColor), for: .normal)
    } else if self.isWished! == false {
      self.detailContentView.headerView.likeButton.setTitleColor(#colorLiteral(red: 0.2199999988, green: 0.2199999988, blue: 0.2199999988, alpha: 1), for: .normal)
    }
    
  }
  
  func setupDetailView() {
    
    
    let guide = view.safeAreaLayoutGuide
    
    view.addSubview(topView)
    topView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    topView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    topView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    topView.heightAnchor.constraint(equalToConstant: 41).isActive = true
    
    view.addSubview(detailContentView)
    detailContentView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
    detailContentView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    detailContentView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    detailContentView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    
  }
}

extension MovieDetailViewController: MovieDetailHeaderViewDelegate {
  func touchUpLikeButton(sender: UIButton) {
    
    
    NetworkService.pushIsWished(url, movieId: movieId) 
    
    
    sender.isSelected.toggle()
    if sender.isSelected == true {
      UIAlertController.show(title: "", message: "보고싶은 영화가 등록되었습니다.", from: self)
      sender.setTitleColor(UIColor.appColor(.selectedCellMintColor), for: .normal)
    } else if sender.isSelected == false {
      UIAlertController.show(title: "", message: "보고싶은 영화가 해제되었습니다.", from: self)
      sender.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    }
  }
  
  
}

extension MovieDetailViewController: MovieDetailTopViewDelegate {
  func touchUpMenuButton() {
    let navigationDrawerVC = NavigationDrawerViewController()
    self.present(navigationDrawerVC, animated: false)
  }
  
  func touchUpDismissButton() {
    
    NetworkService.getAllMovieData(movieReservationURLStr) { result in
      switch result {
      case .success(let data):
        self.shared.allMovieData = data
        self.presentingViewController?.dismiss(animated: false)
      case .failure(let err):
        print(err)
      }
    }
    
  }
  
  
}
