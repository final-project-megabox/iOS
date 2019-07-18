//
//  MypageViewController.swift
//  MegaBox
//
//  Created by 차수연 on 16/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MypageViewController: UIViewController {
  
  let myPageView: MyPageContentView = {
    let view = MyPageContentView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupMaPageView()
  }
  
  
  private func setupMaPageView() {
    let guide = view.safeAreaLayoutGuide
    
    view.addSubview(myPageView)
    myPageView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    myPageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    myPageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    myPageView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
  
}

