//
//  MovieDetailViewController.swift
//  MegaBox
//
//  Created by 차수연 on 04/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
  
  var id = ""
  lazy var url = "http://megabox.hellocoding.shop//database/movieDetail/?movie=\(id)"
  
  let shared = MovieDataManager.shared
  
  

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
    
    NetworkService.getMovieDetailData(url) { (result) in
      switch result {
      case .success(let data):
        self.shared.movieDetailData = data
        print(self.shared.movieDetailData)
      case .failure(let err):
        print(err.localizedDescription)
      }
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
    sender.isSelected.toggle()
    if sender.isSelected {
      UIAlertController.show(title: "", message: "보고싶은 영화가 등록되었습니다.", from: self)
      sender.setTitleColor(UIColor.appColor(.selectedCellMintColor), for: .normal)
    } else {
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
    self.presentingViewController?.dismiss(animated: false)
  }
  
  
}
