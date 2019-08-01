//
//  NavigationDrawerViewController.swift
//  MegaBox
//
//  Created by Fury on 18/07/2019.
//  Copyright © 2019 Fury. All rights reserved.
//

import UIKit

class NavigationDrawerViewController: UIViewController {
  
  let url = "http://megabox.hellocoding.shop//accounts/myPage/"
  
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
  
  // MARK: - 임시 마이페이지 이동
  func touchUpNoticeButton() {
    let myPageVC = MyPageViewController()
//    myPageVC.modalTransitionStyle = UIModalTransitionStyle.coverVertical
    
//    NetworkService.getToken(email: id, pw: pw) { (result) in
//      switch result {
//      case .success(let value):
//        print("token: ", value.token)
//        print("userName: ", value.user.name)
//        let token = value.token
//        let userName = value.user.name
//
//        UserDefaults.standard.set(token, forKey: "Token")
//        UserDefaults.standard.set(userName, forKey: "UserName")
//
//        self.presentingViewController?.dismiss(animated: false)
//      case .failure(let err):
//        print("result: ", err)
//        DispatchQueue.main.async {
//          UIAlertController.show(title: "", message: "아이디와 비밀번호를 확인해주세요.", from: self)
//        }
//
//      }
//    }

    guard let token = UserDefaults.standard.value(forKey: "Token") else { return }
    
    NetworkService.getUserMyPageData(url, token: "JWT \(token)") { (result) in
      switch result {
      case .success(let value):
        print("value: ", value)
        value.watchedMovieNumber
      case .failure(let err):
        print("result: ", err)
      }
    }

    
    self.present(myPageVC, animated: false)
    
    
  }
}



