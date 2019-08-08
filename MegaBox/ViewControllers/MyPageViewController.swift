//
//  MypageViewController.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {
  
  
  let shared = UserDataManager.shared
  
  let myPageTopView: MyPageTopView = {
    let view = MyPageTopView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let myPageView: MyPageContentView = {
    let view = MyPageContentView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    myPageTopView.delegate = self
    myPageView.delegate = self

    getUserData()
    setupMaPageView()
  }
  
  func getUserData() {
   
  }
  
  private func setupMaPageView() {
    let guide = view.safeAreaLayoutGuide
    
    view.addSubview(myPageTopView)
    myPageTopView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    myPageTopView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    myPageTopView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    myPageTopView.heightAnchor.constraint(equalToConstant: 41).isActive = true
    
    view.addSubview(myPageView)
    myPageView.topAnchor.constraint(equalTo: myPageTopView.bottomAnchor).isActive = true
    myPageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    myPageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    myPageView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
  
}

extension MyPageViewController: MyPageTopViewDelegate {
  func touchUpMenuButton(_ sender: UIButton) {
    let navigationDrawerVC = NavigationDrawerViewController()
    self.present(navigationDrawerVC, animated: false)
  }
  
  func touchUpDismissButton(_ sender: UIButton) {
    self.presentingViewController?.dismiss(animated: false)
  }
  
  
}


extension MyPageViewController: MyPageContentViewDelegate {
  func touchUpPreferButton(sender: UIButton) {
    let preferVC = MyPagePreferTheaterViewController()
    self.present(preferVC, animated: false)
  }
  
  
  func touchUpWishMovieButton(sender: UIButton) {
    let wishMovieVC = MyPageWishViewController()
    
    let url = "http://megabox.hellocoding.shop//database/showWishMovies/"
    
    NetworkService.getUserWishMovie(url) { (result) in
      switch result {
      case .success(let data):
        self.shared.wishMovieData = data
        self.present(wishMovieVC, animated: false)
      case .failure(let err):
        print(err.localizedDescription)
      }
    }
   
  }
  
  func touchUpWatchedMovieButton(sender: UIButton) {
    let url = "http://megabox.hellocoding.shop//accounts/showWatchedMovies/"
    let watchedVC = MypageWatchedViewController()
    
    NetworkService.getUserWatchedMovieData(url) { (result) in
      switch result {
      case .success(let data):
        self.shared.watchedMovieData = data
        self.present(watchedVC, animated: false)
      case .failure(let err):
        print(err.localizedDescription)
      }
    }
    
    
  }
  
  
}



