//
//  MyPageWishViewController.swift
//  MegaBox
//
//  Created by 차수연 on 07/08/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MyPageWishViewController: UIViewController {
  
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
    setupWishMovieView()
  }
  
  func setupWishMovieView() {
    
    let guide = view.safeAreaLayoutGuide
    
    view.addSubview(topView)
    topView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    topView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    topView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    topView.heightAnchor.constraint(equalToConstant: 41).isActive = true
    
    view.addSubview(contentView)
    contentView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
    contentView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    contentView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    contentView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
    
    
  }
  

}
