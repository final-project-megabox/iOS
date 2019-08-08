//
//  MyPageWishViewController.swift
//  MegaBox
//
//  Created by 차수연 on 07/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MyPageWishViewController: UIViewController {
  
  let shared = UserDataManager.shared
  
  let noWishMovieView: MyPageNoWishMovieView = {
    let view = MyPageNoWishMovieView()
    view.backgroundColor = #colorLiteral(red: 0.9179489213, green: 0.9179489213, blue: 0.9179489213, alpha: 1)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let topView: MyPageWishMovieTopView = {
    let view = MyPageWishMovieTopView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let contentView: MyPageWishMovieView = {
    let view = MyPageWishMovieView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    topView.delegate = self
    contentView.delegate = self
    getWishMovieCount()
    setupWishMovieView()
  
    
  }
  
  private func getWishMovieCount() {
    if shared.wishMovieData.count == 0 {
      contentView.isHidden = true
    } else {
      contentView.isHidden = false
    }
  }
  
  
  func setupWishMovieView() {
    
    let guide = view.safeAreaLayoutGuide
    
    view.addSubview(topView)
    topView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    topView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    topView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    topView.heightAnchor.constraint(equalToConstant: 41).isActive = true
    
    view.addSubview(noWishMovieView)
    noWishMovieView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
    noWishMovieView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    noWishMovieView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    noWishMovieView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    
    noWishMovieView.addSubview(contentView)
    contentView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
    contentView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    contentView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    contentView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    
    
  }
  

}


extension MyPageWishViewController: MyPageWishMovieTopViewDelegate {
  func touchUpDismissButton(sender: UIButton) {
    self.presentingViewController?.dismiss(animated: false, completion: nil)
  }
  
  
}

extension MyPageWishViewController: MyPageWishMovieViewDelegate {
  func touchUpDeleteButton(sender: UIButton, movieId: Int) {
//    let url = "http://megabox.hellocoding.shop/database/checkwish/"
//    NetworkService.pushIsWished(url, movieId: movieId)
//    print(movieId)
//
//    self.contentView.wishMovieListTableView.reloadData()
    
    
  }
  
  
  
  
}
