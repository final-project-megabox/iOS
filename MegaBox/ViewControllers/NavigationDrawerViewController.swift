//
//  NavigationDrawerViewController.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class NavigationDrawerViewController: UIViewController {
  
  private let shared = UserDataManager.shared
  
  private let navigationDrawerView: NavigationDrawerView = {
    let view = NavigationDrawerView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationDrawerView.delegate = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    startAnimations(isCancel: false)
    navigationDrawerView.navigationDrawerCollectionView.reloadData()
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    
    setupNavigationDrawerView()
  }
  
  private func startAnimations(isCancel: Bool) {
    if isCancel {
      UIView.animate(withDuration: 0.3) {
        self.navigationDrawerView.transform = CGAffineTransform(translationX: -(self.view.frame.width / 4) * 3, y: 0)
      }
      
      UIView.animate(withDuration: 0.3, animations: {
        self.navigationDrawerView.transform = CGAffineTransform(translationX: (self.view.frame.width / 4), y: 0)
      }) { (Bool) in
        self.dismiss(animated: false)
      }
      
    } else {
      UIView.animate(withDuration: 0.3) {
//        self.navigationDrawerView.navigationDrawerCollectionView.
      }
      
    }
  }
  
  private func setupNavigationDrawerView() {
    let guide = view.safeAreaLayoutGuide
    
    view.addSubview(navigationDrawerView)
    navigationDrawerView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
    navigationDrawerView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
    navigationDrawerView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    navigationDrawerView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
  }
}

extension NavigationDrawerViewController: NavigationDrawerViewDelegate {
  func touchUpDismissButton() {
    self.dismiss(animated: false)
  }
  
  func touchUpLoginButton() {
    let loginPageVC = LoginViewController()
    self.present(loginPageVC, animated: false)
  }
  
  //마이페이지 이동
  func touchUpUserNameButton() {
    
    let myPageVC = MyPageViewController()
    
    self.present(myPageVC, animated: false)

//    let url = ApiUrlData.ApiUrl(.myPageApi)
//
//    NetworkService.getUserMyPageData(url) { (result) in
//      switch result {
//      case .success(let value):
//        self.shared.myPageData = value
//        print(value)
//        self.present(myPageVC, animated: false)
//      case .failure(let err):
//        print("result: ", err)
//      }
//    }
    
  }
  
  //환경설정으로 이동
  func touchUpSettingButton() {
    let settingVC = MyPageSettingViewController()
    present(settingVC, animated: false)
  }
  
  
}



