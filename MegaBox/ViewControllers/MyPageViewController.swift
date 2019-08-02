//
//  MypageViewController.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {
  
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
    myPageTopView.delegate = self
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
    self.presentingViewController?.dismiss(animated: true)
  }
  
  
}
